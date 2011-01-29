require 'readability'
require 'open-uri'
class AdaptedPage < ActiveRecord::Base
  
  def get_page_content
    page_text = open(self.url).read

    Readability::Document.new(page_text).content.to_html
  end
end
