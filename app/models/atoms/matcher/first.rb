module Atoms::Matcher
  class First < Atoms::Base
    def execute(job, rule, context)
      context.first
    end
  end
end
