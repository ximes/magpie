module Atoms::Markers
  class Failed < Atoms::Base
    def execute(job, rule, context)
      job.result_status = Jobs::Status::Failed.new
    end
    def self.nestable?; false; end
  end
end
