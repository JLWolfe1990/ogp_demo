require 'rails_helper'

# Example of Job unit test. Only added because of the websocket test setup issue
describe RequestOgpDetailsJob, type: :job do
  context '#perform_now' do
    subject { described_class.perform_now(123)}

    context 'when there is an ogp present' do
      let(:service_instance) { instance_double(RequestOgpDetailsService) }

      it 'should load in the ogp and start the services' do
        expect(Ogp).to receive(:find_by).with(id: 123).and_return(Ogp.new)

        expect(RequestOgpDetailsService).to receive(:new).and_return(service_instance)
        expect(service_instance).to receive(:perform)

        expect(OgpEventNotificationService).to receive(:notify_complete)

        subject
      end
    end
  end
end
