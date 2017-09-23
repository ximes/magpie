require "selenium-webdriver"

module Atoms::PageAction
  class Visit < Atoms::Base
    def execute(job, rule, context)
      Capybara.register_driver :headless_chrome do |app|
        capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
          chromeOptions: {
            args: %w{headless disable-popup-blocking no-sandbox disable-gpu window-size=1400,900},
            binary: ENV.fetch("GOOGLE_CHROME_BIN", nil)
          }
        )

        Capybara::Selenium::Driver.new(
          app,
          browser: :chrome,
          desired_capabilities: capabilities
        )
      end
      Capybara.run_server = false
      Capybara.current_driver = Rails.env.development? ? :selenium_chrome_headless : :headless_chrome
      Capybara.javascript_driver = Rails.env.development? ? :selenium_chrome_headless : :headless_chrome
      Capybara.visit job.url
      Capybara.page
    end
    def after_execute(job, rule, context)
      Capybara.page.driver.quit
    end
  end
end
