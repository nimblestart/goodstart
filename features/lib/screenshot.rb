def capture_screenshot(scenario)
  date_time = Time.now.strftime('%Y%m%d_%H.%M.%S_')
  Dir::mkdir('screenshots') if not File.directory?('screenshots')
  screenshot_filename = "./screenshots/FAILED_#{date_time}_#{scenario.name.gsub(' ','_').gsub(/[^0-9A-Za-z_]/, '')}.png"
  @browser.save_screenshot screenshot_filename
end