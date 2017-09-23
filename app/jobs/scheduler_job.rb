class SchedulerJob < ApplicationJob
  queue_as :schedulers

  def perform(*args)
    jobs = Scheduler.jobs_to_perform

    jobs.each do |job|
      JobPerformerJob.perform_later(job)
    end
  end
end
