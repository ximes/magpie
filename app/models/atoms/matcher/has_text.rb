module Atoms::Matcher
  class HasText < Atoms::Base
    attr_accessor :value
    def accessible_options
      [:value]
    end

    def execute(job, rule, context)
      context.has_text?(@value)
    end
  end
end
