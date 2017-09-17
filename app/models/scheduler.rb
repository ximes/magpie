class Scheduler < ApplicationRecord
  validates :job, presence: true
  validates :time, presence: true

  belongs_to :job, foreign_key: "job_id"

  serialize :schedule, Hash

  scope :enabled, -> { where(enabled: true) }

  def schedule=(new_rule)
    if RecurringSelect.is_valid_rule?(new_rule)
      write_attribute(:schedule, RecurringSelect.dirty_hash_to_rule(new_rule)&.to_hash)
    else
      write_attribute(:schedule, nil)
    end
  end
end
