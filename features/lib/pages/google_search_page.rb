class GoogleSearchPage
  include PageObject

  page_url 'http://www.google.com'
  text_field(:search_text_box, id: 'gbqfq')
  #text_field(:search_text_box, class: '1st')
  button(:search_button, id: 'gbqfb')
end