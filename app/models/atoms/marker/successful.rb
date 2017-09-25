module Atoms::Marker
  class Successful < Atoms::Base
    def execute(job, rule, context)
      if context
        job.result_status = Jobs::Status::Successful.new
        raise Jobs::Status::DoneError.new
      end
    end
    def self.nestable?; false; end
  end
end
