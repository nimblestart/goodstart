After do |scenario|
  if scenario.failed?
    capture_screenshot(scenario)

    #code to save the html to debug especially headless
    date_time = Time.now.strftime('%Y%m%d_%H.%M.%S_')
    open("./screenshots/"+date_time+".html", "wb") do |file|
        file.write(@browser.page_source)
    end
  end
end