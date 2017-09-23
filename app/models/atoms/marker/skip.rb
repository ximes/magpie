module Atoms::Marker
  class Skip < Atoms::Base
    def execute(job, rule, context)
      job.result_status = Jobs::Status::Skip.new
    end
    def self.nestable?; false; end
  end
end
