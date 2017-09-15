module Atoms::Events
  class Click < Atoms::Rule
    def execute(job, rule, context)
      context.click
      Capybara.current_session
    end
  end
end
