# Captures Browser screenshot as .png
#
# @param [String] scenario value of the scenario object
def capture_screenshot(scenario)
  date_time = Time.now.strftime('%Y%m%d_%H.%M.%S_')
  Dir::mkdir('screenshots') if not File.directory?('screenshots')
  screenshot_filename = "./screenshots/FAILED_#{date_time}_#{scenario.name.gsub(' ','_').gsub(/[^0-9A-Za-z_]/, '')}.png"
  @browser.save_screenshot screenshot_filename
end

# Saves the Browser page source
#
# @param [String] scenario value of the scenario object
def capture_page_source(scenario)
  date_time = Time.now.strftime('%Y%m%d_%H.%M.%S_')
  Dir::mkdir('screenshots') if not File.directory?('screenshots')
  page_source_filename = "./screenshots/FAILED_#{date_time}_#{scenario.name.gsub(' ','_').gsub(/[^0-9A-Za-z_]/, '')}.html"
  open(page_source_filename, "wb") do |file|
    file.write(@browser.page_source)
  end
end