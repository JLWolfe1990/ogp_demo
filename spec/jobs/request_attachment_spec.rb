require 'rails_helper'

# Example of Job unit test. Only added because of the websocket test setup issue
describe RequestAttachmentJob, type: :job do
  context '#perform' do
    subject { described_class.perform_now(attachable) }

    context 'when there is an ogp present' do
      let(:attachable) { instance_double(Ogp) }
      let(:attachment) { instance_double(Attachment) }

      it 'should load in the ogp and start the services' do
        allow(attachable).to receive(:create_attachment).and_return(attachment)
        allow(attachable).to receive(:notify!)
        allow(attachment).to receive(:update_details!)

        subject
      end
    end
  end
end
