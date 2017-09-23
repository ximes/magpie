module Atoms::Matcher
  class First < Atoms::Base
    def execute(job, rule, context)
      context.first
    end

    def after_execute(job, rule, context)
    end
  end
end
