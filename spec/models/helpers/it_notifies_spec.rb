shared_examples 'it notifies' do
  context 'required methods' do
    subject { instance }

    it 'instance#attachment' do
      expect(subject).to respond_to(:notify!)
    end
  end
end