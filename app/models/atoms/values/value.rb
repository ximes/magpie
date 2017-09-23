module Atoms::Values
  class Value < Atoms::Base
    def execute(job, rule, context)
      job.result_contents << context.attribute("value")
    end
  end
end
