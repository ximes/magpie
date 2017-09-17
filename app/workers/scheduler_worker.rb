# frozen_string_literal: true

class SchedulerWorker
  include Sidekiq::Worker
  def perform(*args)
    jobs = []
    Scheduler.enabled.each do |scheduler|
      # TODO job date start/end check
      jobs << scheduler.job if scheduler.job.enabled? && IceCube::Schedule.from_hash(scheduler.schedule).occurs_between?(Time.now, Time.now + 10.minutes)
    end
    jobs.uniq.each do |job|
      JobPerformerJob.perform_later(job)
    end
  end
end
