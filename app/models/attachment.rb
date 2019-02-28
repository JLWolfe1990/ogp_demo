class Attachment < ApplicationRecord
  belongs_to :attachable, polymorphic: true

  validates :attachable, presence: true

  delegate :notify!, to: :attachable, prefix: true

  def update_details!
    update(title: html_title, url: html_url)
  end

  private

  def html_title
    html.xpath('/html/head/title').text
  end

  def html_url
    # pretty hacked together, but I got stuck and had to find some sort of solution
    html.xpath('/html/head/meta[@property="og:image"]').xpath('//*[@property="og:image"]')
      .first.attributes['content'].value
  end

  def html
    @html ||= Nokogiri::HTML(response)
  end

  def response
    HTTParty.get(attachable.path)
  end

  class InvalidDocumentException < Exception; end
end