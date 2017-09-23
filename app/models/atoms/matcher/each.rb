module Atoms::Matcher
  class Each < Atoms::Base
    def execute(job, rule, context)
      context
    end

    def self.iterates?; true; end
  end
end
