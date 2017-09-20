module Atoms::Markers
  class Successful < Atoms::Base
    def execute(job, rule, context)
      job.result_status = Jobs::Status::Successful.new
    end
    def self.nestable?; false; end
  end
end
