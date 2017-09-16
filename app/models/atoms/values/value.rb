module Atoms::Values
  class Value < Atoms::Rule
    def execute(job, rule, context)
      job.result_contents << context.attribute("value")
    end
  end
end
