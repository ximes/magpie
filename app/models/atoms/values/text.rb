module Atoms::Values
  class Text < Atoms::Rule
    def execute(job, rule, context)
      job.result_contents << context.text
    end
  end
end
