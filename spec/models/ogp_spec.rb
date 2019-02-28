describe Ogp do
  let(:instance) { described_class.new }
  it_should_behave_like 'it has an attachment'
  it_should_behave_like 'it notifies'

  context 'instance#as_json' do
    subject { instance.as_json }

    context 'when there is not an attachment instance' do
      let(:user) { User.create(full_name: 'Joshua Lee Wolfe') }
      let(:instance) { described_class.create!(user_id: user.id, path: 'https://www.slack.com/') }

      it 'should not raise an error' do
        expect { subject }.to_not raise_exception
      end
    end
  end
end