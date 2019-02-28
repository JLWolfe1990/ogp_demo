class OgpEventNotificationService
  def self.notify_complete(ogp)
    # stubbed for now since there is only one use case
    channel = 'ogp-channel'
    event = 'ogp-event'

    send!(channel, event, data(ogp))
  end

  # this could contain other notification service 'endpoints'

  private

  def self.data(ogp)
    { show_path: ogp.show_path}
  end

  def self.send!(channel, event, data)
    raise InvalidNotificationException unless channel.present? && event.present?

    Pusher.trigger(channel, event, data)
  end

  class InvalidNotificationException < Exception; end
end