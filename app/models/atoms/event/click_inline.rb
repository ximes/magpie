module Atoms::Event
  class ClickInline < Atoms::Base
    attr_accessor :selector

    def accessible_options
      [:selector]
    end

    def execute(job, rule, context)
      context.click_link(@selector)
      sleep(3)
      context
    end
  end
end
