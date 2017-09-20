module Atoms::Events
  class Click < Atoms::Base
    def execute(job, rule, context)
      context.click
      Capybara.current_session
    end
  end
end
