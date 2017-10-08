class Job < ApplicationRecord
  validates :name, presence: true
  validates :start_date, presence: true
  validates :url, presence: true, url: true

  has_many :steps, dependent: :destroy, class_name: "Jobs::Step", inverse_of: :job
  has_many :rules, through: :steps
  has_many :schedulers, inverse_of: :job

  has_one :result, class_name: "Jobs::Result", dependent: :destroy

  scope :enabled, -> { where(enabled: true) }

  accepts_nested_attributes_for :schedulers, reject_if: :all_blank, allow_destroy: true

  include Configurable

  belongs_to :user, required: true

  attr_accessor :result_contents
  attr_accessor :result_status

  def results
    result ? last_result_and_versions : []
  end

  def status
    result ? result.status : nil
  end

  def configuration
    customizable? ? super : build_configuration(user.configuration.accessible_attributes)
  end

  def perform!
    perform(preview: false)
  end

  def perform(preview: true)
    return unless enabled || preview

    @result_contents = []
    @result_status = ""

    begin
      steps.each do |step|
        step.rules.enabled.each do |rule|
          children_rules(rule)
        end
      end
    rescue Jobs::Status::DoneError => ex
    rescue => ex
      self.result_status = Jobs::Status::Failed.new
      Rails.logger.debug ex.backtrace.join("\n")
      self.result_contents = [ex.message]
    end

    result_options = { result: result_contents.join(" -\r\n "), updated_at: Time.now, status: result_status.to_s }

    notification_message = self.result.to_s

    if configuration.track_job_results? || configuration.track_job_status?
      tracking_options = result_options.dup
      tracking_options.except!(:result) unless configuration.track_job_results?
      tracking_options.except!(:status, :updated_at) unless configuration.track_job_status?

      if !preview && diff_job_results?(tracking_options)
        self.result&.update_attributes(result_options) || self.create_result!(result_options)
      end
    end

    if configuration.job_notification? && (configuration.notify_job_results? || configuration.notify_job_status?)
      unless preview
        if configuration.notify_job_results?
          notification_message += " \r\nresult: #{self.result.result}"
        end
        if configuration.notify_job_status?
          notification_message += " \r\nstatus: #{self.result.status}"
        end
        Notifiers::Telegram.new(notification_message) unless Rails.env.test?
      end
    end

    result_options
  end

  def to_s
    name
  end

  private

    def diff_job_results?(tracking_options)
      return true unless configuration.diff_job_results?
      begin
        results.last.result != tracking_options[:result]
      rescue
        true
      end
    end

    def last_result_and_versions
      ([result] + result.versions.map { |v| v.reify }).compact
    end

    def children_rules(item, context = nil)     
      if context = child_execute(item, context)
        if item.iterates?
          context.each do |child_item|
            execute_all_children(item, child_item)
          end
        else
          execute_all_children(item, context)
        end
      end
    ensure
      after_execute(item, context)
    end

    def execute_all_children(item, context = nil)
      if item.children.enabled
        item.children.enabled.each do |rule|
          children_rules(rule, context)
        end
      end
    end

    def child_execute(rule, context = nil)
      rule.atom_instance.execute(self, rule, context)
    end

    def after_execute(rule, context = nil)
      rule.atom_instance.after_execute(self, rule, context)
    end
end
