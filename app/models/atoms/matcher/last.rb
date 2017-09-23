module Atoms::Matcher
  class Last < Atoms::Base
    def execute(job, rule, context)
      context.last
    end
  end
end
