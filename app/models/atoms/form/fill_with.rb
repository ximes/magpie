module Atoms::Form
  class FillWith < Atoms::Base
    attr_accessor :selector, :value

    def accessible_options
      [:selector, :value]
    end

    def execute(job, rule, context)
      context.fill_in(@selector, with: @value)
    end

    def self.nestable?; false; end
  end
end
