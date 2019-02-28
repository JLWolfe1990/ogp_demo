class RequestOgpDetailsService
  def initialize(ogp)
    @ogp = ogp
  end

  def perform
    begin
      @ogp.update(image_url: image_url, title: title)
    rescue NoMethodError
      Rails.logger.error('Failed to decode ogp')
    end

  end

  def response
    HTTParty.get(@ogp.path)
  end

  def html
    Nokogiri::HTML(response)
  end

  def title
    html.xpath('/html/head/title').text
  end

  def image_url
    # pretty hacked together, but I got stuck and had to find some sort of solution
    html.xpath('/html/head/meta[@property="og:image"]').xpath('//*[@property="og:image"]').first.attributes['content'].value
  end
end