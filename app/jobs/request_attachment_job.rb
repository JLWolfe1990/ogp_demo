class RequestAttachmentJob < ApplicationJob
  queue_as :default

  def perform(attachable)
    begin
      attachable.create_attachment.update_details!
      attachable.notify!
    rescue ActiveRecord::RecordNotFound
      Rails.logger.warn('Unable to find attachable')
    rescue Attachment::InvalidDocumentException
      Rails.logger.warn('Unable to produce a valid attachment for this request')
    end
  end
end
