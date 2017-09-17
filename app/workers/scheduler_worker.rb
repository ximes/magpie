# frozen_string_literal: true

class SchedulerWorker
  include Sidekiq::Worker
  def perform(*args)
    jobs = []

    time = Time.now

    Scheduler.enabled.each do |scheduler|
      # TODO job date start/end check
      ic_schedule = IceCube::Schedule.new
      ic_schedule.add_recurrence_rule(IceCube::Rule.from_hash(scheduler.schedule))
      (jobs << scheduler.job) if scheduler.job.enabled? && ic_schedule.occurrences(time).first.change(hour: scheduler.time.hour, min: scheduler.time.min).between?(time, time + 10.minutes)
    end
    jobs.uniq.each do |job|
      JobPerformerJob.perform_later(job)
    end
  end
end
