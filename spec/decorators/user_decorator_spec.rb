describe UserDecorator do
  context 'when name is present' do
    let(:user) { create(:user, first_name: 'John', last_name: 'Doe') }

    it 'should return correct display name' do
      expect(user.decorate.display_name).to eq('John Doe')
    end
  end

  context 'when name is blank' do
    let(:user) { create(:user, first_name: '', last_name: '') }

    it 'should return "User" as display name' do
      expect(user.decorate.display_name).to eq('User')
    end
  end
end