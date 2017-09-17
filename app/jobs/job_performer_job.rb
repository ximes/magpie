class JobPerformerJob < ApplicationJob
  queue_as :default

  def perform(job)
    job.perform!
  end
end
