module Atoms::Matcher
  class Nth < Atoms::Base
    attr_accessor :number

    def accessible_options
      [:number]
    end

    def execute(job, rule, context)
      number = @number.to_i ? @number.to_i - 1 : 0
      context[number] || nil
    end
  end
end
