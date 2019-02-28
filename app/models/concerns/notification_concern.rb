module NotificationConcern
  extend ActiveSupport::Concern

  included do
    [:notify, :channel, :event, :notification_data].each do |method_name|
      define_method(method_name) do
        raise InterfaceException, 'Classes with this concern must implement this method'
      end
    end

    def send!
      raise InvalidNotificationException unless channel.present? && event.present?

      Pusher.trigger(channel, event, notification_data)
    end
  end

  class InterfaceException < Exception; end
  class InvalidNotificationException < Exception; end
end
