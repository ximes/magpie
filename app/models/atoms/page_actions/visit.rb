require "selenium-webdriver"
require "capybara/poltergeist"

module Atoms::PageActions
  class Visit < Atoms::Rule
    def execute(job, rule, context)
      Capybara.register_driver :poltergeist do |app|
        Capybara::Poltergeist::Driver.new(
          app,
          js_errors: false,
          debug: false,
          phantomjs_options: ["--load-images=no", "--web-security=true"]
        )
      end
      Capybara.run_server = false
      Capybara.current_driver = Rails.env.development? ? :selenium : :poltergeist
      Capybara.javascript_driver = Rails.env.development? ? :selenium : :poltergeist
      Capybara.visit job.url
      Capybara.page
    end
    def after_execute(job, rule, context)
      Capybara.page.driver.quit
    end
  end
end
