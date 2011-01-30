module AdaptedPagesHelper
  
  def resolve(url, page_url, prefix = '')
    print "#{url}, page: #{page_url} \n"
    
    begin
      base_url = url.nil? || url.empty? ? page_url : URI.join(page_url,url).to_s
    rescue URI::InvalidURIError
      base_url = ''
    end
    return prefix + base_url
  end
end
