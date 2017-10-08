module Atoms::Value
  class Value < Atoms::Base
    def execute(job, rule, context)
      job.result_contents << context.attribute("value")
    end
    def self.nestable?; false; end
  end
end
