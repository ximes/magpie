class Job < ApplicationRecord
  validates :name, presence: true
  validates :start_date, presence: true
  validates :url, presence: true, url: true

  has_many :steps, dependent: :destroy, class_name: "Jobs::Step", inverse_of: :job
  has_many :rules, through: :steps

  has_one :result, class_name: "Jobs::Result", dependent: :destroy

  include Configurable

  belongs_to :user, required: true

  def results
    result.versions
  end

  def configuration
    customizable? ? super : build_configuration(user.configuration.accessible_attributes)
  end

  def perform
    steps.each do |step|
      p step.rules
      step.rules.each do |rule|

        p rule.atom.class_name.constantize
        rule.atom.class_name.constantize.new.execute
      end
    end
  end
end
