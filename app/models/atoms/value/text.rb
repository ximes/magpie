module Atoms::Value
  class Text < Atoms::Base
    def execute(job, rule, context)
      job.result_contents << context.text
    rescue
      ""
    end
  end
end
