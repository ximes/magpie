module Atoms::Event
  class Click < Atoms::Base
    def execute(job, rule, context)
      Rails.logger.debug Capybara.windows.inspect
      if target = context["href"]
        @window = Capybara.switch_to_window Capybara.open_new_window
        Capybara.visit(target)
        Capybara.current_session
      end
    end
    def after_execute(job, rule, context)
      Capybara.windows.last.close
      Capybara.switch_to_window Capybara.windows.last
    end
  end
end
