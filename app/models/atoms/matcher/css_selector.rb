module Atoms::Matcher
  class CssSelector < Atoms::Base
    attr_accessor :selector

    def accessible_options
      [:selector]
    end

    def execute(job, rule, context)
      context.all(@selector)
    end
  end
end
