class Job < ApplicationRecord
  validates :name, presence: true
  validates :start_date, presence: true
  validates :url, presence: true, url: true

  has_many :steps, dependent: :destroy, class_name: "Jobs::Step", inverse_of: :job
  has_many :rules, through: :steps
  has_many :schedulers, inverse_of: :job

  has_one :result, class_name: "Jobs::Result", dependent: :destroy

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

    steps.each do |step|
      step.rules.enabled.each do |rule|
        children_rules(rule)
      end
    end

    result_options = { result: result_contents.join, updated_at: Time.now, status: result_status.to_s }

    unless preview
      self.result&.update_attributes(result_options) || self.create_result!(result_options)
    end

    result_options
  end

  private

    def last_result_and_versions
      ([result] + result.versions.map { |v| v.reify }).compact
    end

    def children_rules(item, context = nil)
      context = child_execute(item, context)
      if item.children.enabled
        item.children.enabled.each do |rule|
          children_rules(rule, context)
        end
      end
    ensure
      after_execute(item, context)
    end
    def child_execute(rule, context = nil)
      rule.atom_instance.execute(self, rule, context)
    end
    def after_execute(rule, context = nil)
      rule.atom_instance.after_execute(self, rule, context)
    end
end
