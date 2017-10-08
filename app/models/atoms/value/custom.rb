module Atoms::Value
  class Custom < Atoms::Base
    attr_accessor :value
    def accessible_options
      [:value]
    end

    def execute(job, rule, context)
      job.result_contents << @value
    end

    def self.nestable?; false; end
  end
end
