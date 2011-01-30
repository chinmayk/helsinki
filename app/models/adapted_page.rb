require 'readability'
require 'open-uri'
class AdaptedPage < ActiveRecord::Base
  
  def get_page_content
    page_text = open(self.url).read

    Readability::Document.new(page_text).content.to_html
  end
  
  def self.get_next_page_for(user)
    page_source = PageSource.first
    
    #Open up the page, and fetch a link. Then create an AdaptedPage for this page/or find it if it
    #exists. Return the page text.
    
    source_doc = Nokogiri::HTML(open(page_source.url))
    
    page_link = source_doc.css(page_source.links_path).first
    
    adapted_page = self.find_or_create_by_url(page_link[:href])
    
    adapted_page
    
  end
end
