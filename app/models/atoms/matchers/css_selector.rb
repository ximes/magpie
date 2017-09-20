module Atoms::Matchers
  class CssSelector < Atoms::Base
    attr_accessor :selector

    def accessible_options
      [:selector]
    end

    def execute(job, rule, context)
      context.first(self.selector)
    end
  end
end
