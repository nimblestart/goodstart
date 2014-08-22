require 'selenium-webdriver'
require 'cucumber'
require 'page-object'
require 'page-object/page_factory'
require 'rspec/expectations'
require 'headless'

require_relative '../support/hooks'
require_relative '../lib/screenshot'
require_relative '../lib/browser'
require_relative '../lib/pages/google_search_page'

World(PageObject::PageFactory)

#browser = Selenium::WebDriver.for :firefox
# Setup Browser
browser = Browser.new(ENV['BROWSER'])
browser.delete_cookies
browser.set_timeout(20)

# Actions performed before each scenario
Before do
  #Page Objects need the driver instance not the browser class instance
  @browser = browser.driver
end

at_exit do
  browser.driver.quit
end