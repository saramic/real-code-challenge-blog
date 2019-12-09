require "capybara/rspec"
require "capybara-screenshot/rspec"
require "webdrivers/chromedriver"

Capybara.register_driver :selenium_chrome do |app|
  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
  )
end

Capybara.javascript_driver = :selenium_chrome
Capybara.app_host = "http://localhost:3000"
