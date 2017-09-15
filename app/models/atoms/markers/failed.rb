module Atoms::Markers
  class Failed < Atoms::Rule
    def execute(job, rule, context)
      job.result_status = false
    end
    def self.nestable?; false; end
  end
end
