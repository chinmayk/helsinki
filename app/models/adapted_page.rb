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
  
  
  def self.get_next_page_for(user, next_index = 0)
    page_source = PageSource.first
    
    #Open up the page, and fetch a link. Then create an AdaptedPage for this page/or find it if it
    #exists. Return the page text.
    
    source_doc = Nokogiri::HTML(open(page_source.url))
    
    page_link = source_doc.css(page_source.links_path)[next_index]
    
    adapted_page = self.find_or_create_by_url(page_link[:href])
    
    adapted_page
    
  end
end
