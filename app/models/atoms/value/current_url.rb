module Atoms::Value
  class CurrentUrl < Atoms::Base
    def execute(job, rule, context)
      job.result_contents << Capybara.current_url
    rescue
      ""
    end
    def self.nestable?; false; end
  end
end
