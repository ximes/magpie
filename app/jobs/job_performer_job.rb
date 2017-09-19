class JobPerformerJob < ApplicationJob
  queue_as :performers

  def perform(job)
    job.perform!
  end
end
