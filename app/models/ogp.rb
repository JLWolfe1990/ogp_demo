class Ogp < ApplicationRecord
  include NotificationConcern

  # it is important to use after commit here because the background
  # job will not be able to see the new Ogp object until it
  # is fully committed to the database
  after_commit :start_ogp_details_request, on: :create

  belongs_to :user
  has_one :attachment, as: :attachable

  validates :path, url: { allow_blank: false }

  delegate :url, :title, to: :attachment, allow_nil: true

  # this would go in some other builder in a more legitimate implementation
  #
  # present client with simplified structure
  def as_json
    {
      user_id: user.id,
      show_path: show_path,
      image_url: attachment&.url,
      title: attachment&.title
    }
  end

  alias :notification_data :as_json

  def notify!
    send!
  end

  private

  def show_path
    Rails.application.routes.url_helpers.ogp_path(self, format: :json)
  end

  def channel
    'ogp-channel'
  end

  def event
    'ogp-event'
  end

  def start_ogp_details_request
    RequestAttachmentJob.perform_later(self)
  end
end