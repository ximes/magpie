# frozen_string_literal: true

class SchedulerWorker
  include Sidekiq::Worker
  def perform(*args)
    jobs = Scheduler.jobs_to_perform

    jobs.each do |job|
      JobPerformerJob.perform_later(job)
    end
  end
end
