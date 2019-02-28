class OgpEventNotificationService
  def self.notify_complete(ogp)
    channel = 'ogp-channel'
    event = 'ogp-event'

    data = { show_path: ogp.show_path}

    send!(channel, event, data)
  end

  # this could contain other notification service 'endpoints'

  private

  def self.send!(channel, event, data)
    raise InvalidNotificationException unless channel.present? && event.present?

    Pusher.trigger(channel, event, data)
  end

  class InvalidNotificationException < Exception; end
end