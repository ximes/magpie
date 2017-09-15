module Atoms::Markers
  class Successful < Atoms::Rule
    def execute(job, rule, context)
      job.result_status = true
    end
    def self.nestable?; false; end
  end
end
