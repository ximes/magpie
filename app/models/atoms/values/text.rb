module Atoms::Values
  class Text < Atoms::Base
    def execute(job, rule, context)
      job.result_contents << context.text
    end
  end
end
