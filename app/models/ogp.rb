class Ogp < ApplicationRecord
  # it is important to use after commit here because the background
  # job will not be able to see the new Ogp object until it
  # is fully committed to the database
  after_commit :start_request_details, on: :create

  belongs_to :user

  validates :image_url, url: { allow_blank: true }
  validates :path, url: { allow_blank: false }

  # this would go in some other builder in a more legitimate implementation
  def as_json
    {
      user_id: user.id,
      show_path: show_path,
      image_url: image_url,
      title: title
    }
  end

  def show_path
    Rails.application.routes.url_helpers.ogp_path(self, format: :json)
  end

  private

  def start_request_details
    RequestOgpDetailsJob.perform_later(id)
  end
end