shared_examples 'it has an attachment' do
  context 'required methods' do
    subject { instance }

    it 'instance#attachment' do
      expect(subject).to respond_to(:attachment)
    end
  end
end