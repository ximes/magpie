module Atoms::Matcher
  class CssSelector < Atoms::Base
    attr_accessor :selector

    def accessible_options
      [:selector]
    end

    def execute(job, rule, context)
      elements = context.all(@selector)
      elements.any? ? elements : nil
    end
  end
end
