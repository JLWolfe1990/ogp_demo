describe OgpEventNotificationService do
  let(:service_mock) { instance_double(described_class) }
  let(:ogp_mock) { instance_double(Ogp) }

  context '#data' do
    subject { described_class.send(:data, ogp_mock) }

    # this is an extremely granular unit test to preserve the API over time
    it 'should include the show_path key' do
      allow(ogp_mock).to receive(:show_path).and_return('/ogps/1.json')
      expect(subject.keys).to include(:show_path)
    end
  end
end