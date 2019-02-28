class RequestOgpDetailsJob < ApplicationJob
  queue_as :default

  # in most implementations you can pass the entire object, but I prefer not
  # to because if the object DNE in the DB anymore for some reason down the line,
  # the find error is much easier to understand in Sentry
  def perform(ogp_id)
    ogp = Ogp.find_by(id: ogp_id)
    return unless ogp

    RequestOgpDetailsService.new(ogp).perform

    # this could be it's own job and service combo, but I think that it could also
    # be appropriate here for this use case
    OgpEventNotificationService.notify_complete(ogp)
  end
end
