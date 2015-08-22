# Setup Capybara so that we can use the DSL for writing the tests
require 'capybara/rspec'
require 'selenium-webdriver'

# We will use the selenium driver
Capybara.default_driver = :selenium

# We will not run our own server; we will connect to a remote server
Capybara.run_server = false

# Set the base URL for all our tests
Capybara.app_host = 'https://georchestra.mydomain.org'


# Monkey-patch selenium to leave the browser opened
# after execution
#Selenium::WebDriver::Driver.class_eval do
#  def quit
#    STDOUT.puts "#{self.class}#quit: no-op"
#  end
#end

Capybara.register_driver :selenium do |app|
  # It will require to install the chromedriver package
  # and add /usr/lib/chromium to the PATH
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
  #Capybara::Selenium::Driver.new(app, :browser => :firefox)
end

window = Capybara.current_session.driver.browser.manage.window
window.maximize

