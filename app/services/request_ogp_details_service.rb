class RequestOgpDetailsService
  def initialize(ogp)
    @ogp = ogp
  end

  def perform
    response = HTTParty.get(@ogp.path)

    html = Nokogiri::HTML(response)

    title =  html.xpath('/html/head/title').text
    image_url =  html.xpath('/html/head/meta[@property="og:image"]').xpath('//*[@property="og:image"]').first.attributes['content'].value

    return nil unless image_url && title # both required

    @ogp.update(image_url: image_url, title: title)
  end
end