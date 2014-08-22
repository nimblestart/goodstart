Given(/^I am on google home page$/) do
  visit GoogleSearchPage
end

When(/^I fill in search query with (.*)$/) do |keyword|
  on GoogleSearchPage do |page|
    page.search_text_box = keyword
  end
end

And(/^I click on google search$/) do
  #short version of above syntax in case only one browser action is needed
  on(GoogleSearchPage).search_button
end

Then(/^I should see (.*)$/) do |result|
  @browser.page_source.include? result
  #@browser.page_source.expect include (result)
end