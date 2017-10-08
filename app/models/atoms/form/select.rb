module Atoms::Form
  class Select < Atoms::Base
    attr_accessor :selector, :value

    def accessible_options
      [:selector, :value]
    end

    def execute(job, rule, context)
      context.select(@value, from: @selector)
    end

    def self.nestable?; false; end
  end
end
