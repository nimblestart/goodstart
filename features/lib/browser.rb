class Browser

  attr_reader :driver, :browser_name

  # Initialises Browser Class
  #
  # @param [String] browserName defines the browserName
  def initialize(browser_name)
    @browser_name    = browser_name
    @driver          = start_browser(@browser_name)
  end

  # Deletes all cookies from the browser
  def delete_cookies
    @driver.manage.delete_all_cookies
    puts "Deleted all the cookies"
  end

  # Sets the timeout to find elements
  #
  # @param [String] timeout value for timeout
  def set_timeout(timeout)
    @driver.manage.timeouts.implicit_wait = timeout
    puts "Browser timeout set to: " + timeout.to_s
  end

  # Starts the browser
  #
  # @param [String] browser define browser to use
  def start_browser(browser)

    # Define browser to use from config
    case browser
      when 'firefox'
        driver = Selenium::WebDriver.for :firefox
      when 'chrome'
        driver = Selenium::WebDriver.for :chrome
      when 'safari'
        driver = Selenium::WebDriver.for :safari
      when 'headless'
        driver = Selenium::WebDriver.for :phantomjs
      when 'debug'
        debug_profile = Selenium::WebDriver::Firefox::Profile.new
        debug_profile.add_extension "firebug-1.9.1-fx.xpi"
        driver = Selenium::WebDriver.for :firefox, :profile => debug_profile
        @browser_name = 'Firefox (Firebug)'
      else
        # Default to using chrome
        driver = Selenium::WebDriver.for :firefox
        @browser_name = 'Firefox (default)'
    end

    # Return driver
    puts "Driver initialized for browser: " + @browser_name
    return driver
  end

end