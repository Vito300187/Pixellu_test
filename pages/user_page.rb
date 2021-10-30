class UserPage
  include Capybara::DSL

  def page_fully_loaded?
    page.has_text?('Slideshows') &&
      page.has_text?('Increase your slideshow maximum, lift the 30-second limit on downloads, and remove watermarks by upgrading to a subscription.')
  end
end
