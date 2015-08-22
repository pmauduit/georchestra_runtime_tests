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

window = Capybara.current_session.driver.browser.manage.window
window.maximize
