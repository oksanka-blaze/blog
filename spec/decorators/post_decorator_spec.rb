describe PostDecorator do
  context 'when author name is present' do
    let(:user) { create(:user, first_name: 'John', last_name: 'Doe') }
    let(:post) { create(:post, user: user) }

    it 'should return correct display name' do
      expect(post.decorate.author_name).to eq('John Doe')
    end
  end

  context 'when author name is NOT present' do
    let(:user) { create(:user, first_name: '', last_name: '') }
    let(:post) { create(:post, user: user) }

    it 'should return correct display name' do
      expect(post.decorate.author_name).to eq('User')
    end
  end
end