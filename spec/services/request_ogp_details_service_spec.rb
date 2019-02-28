describe RequestOgpDetailsService do
  let(:service_mock) { instance_double(described_class) }
  let(:ogp_mock) { Ogp.create(path: 'https://www.slack.com') }

  context 'instance#perform' do
    subject { described_class.new(ogp_mock).perform }

    it 'should return nil if there is no image_url available' do
      expect(subject).to be_falsey
    end

    it 'should return nil if there is no title available' do
      expect(subject).to be_falsey
    end

    it 'should not raise an error' do
      expect { subject }.to_not raise_exception
    end
  end
end