module Atoms::Matcher
  class CssSelector < Atoms::Base
    attr_accessor :selector

    def accessible_options
      [:selector]
    end

    def execute(job, rule, context)
      context.all(self.selector)
    end
  end
end
