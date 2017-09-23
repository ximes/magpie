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

  def self.jobs_to_perform
    jobs = []
    time = Time.zone.now

    Scheduler.enabled.each do |scheduler|
      # TODO job date start/end check
      ic_schedule = IceCube::Schedule.new
      ic_schedule.add_recurrence_rule(IceCube::Rule.from_hash(scheduler.schedule))
      (jobs << scheduler.job) if scheduler.job.enabled? && ic_schedule.first.to_date == Date.today && scheduler.time.strftime("%H%M") == Time.now.strftime("%H%M")
    end
    jobs
  end
end
