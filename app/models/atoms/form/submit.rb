module Atoms::Form
  class Submit < Atoms::Base
    attr_accessor :selector, :value
    def accessible_options
      [:selector]
    end

    def execute(job, rule, context)
      context.click_on(@selector)
    end

    def self.nestable?; false; end
  end
end
