require 'readability'
require 'open-uri'
require 'content-identifier'

class AdaptedPage < ActiveRecord::Base
  
  attr_accessor :logo_src, :title, :page_content
  
  def recognize
    @page_text = open(self.url).read
    @recognizer = HeuristicIdentifier.new(@page_text)
    
    @logo_src = @recognizer.GetLogo
    @page_content = Readability::Document.new(@page_text).content.to_html
    @title = @recognizer.GetTitle
  end
  
  
  def self.get_next_page_for(user, next_index = 0, page_source_id = 1)
    page_source = PageSource.find(page_source_id)
    
    #Open up the page, and fetch a link. Then create an AdaptedPage for this page/or find it if it
    #exists. Return the page text.
    
    
    page_link = page_source.get_link_by_index(next_index)
    
    adapted_page = self.find_or_create_by_url(page_link[:href])
    
    adapted_page
  end
end
