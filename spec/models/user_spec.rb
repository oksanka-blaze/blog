require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:email) }
  it { is_expected.to validate_presence_of(:password) }
  it { is_expected.to validate_length_of(:first_name).is_at_most(25).is_at_least(2) }
  it { is_expected.to validate_length_of(:last_name).is_at_most(25).is_at_least(2) }
  
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
