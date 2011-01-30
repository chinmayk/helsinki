require 'nokogiri'
require 'open-uri'
class PageSource < ActiveRecord::Base
attr_reader :doc


def get_link_by_index(index)
    page_link = self.doc.css(self.links_path)[index]
end

def doc
  if self.updated_at.nil? || self.updated_at < 3.minutes.ago
    self.content = open(self.url).read
    @doc = nil
  end
  @doc ||= Nokogiri::HTML(self.content)
end 

def page_links
  self.doc.css(self.links_path)
end

end
