require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:user)).to be_valid
  end

  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:email) }
  it { is_expected.to validate_presence_of(:password) }

  context do
    let(:user) { FactoryGirl.create(:user) }

    it 'should return correct display name' do
      expect(user.display_name).to eq (user.first_name + ' ' + user.last_name)
    end
  end

  context do
    let(:user) { FactoryGirl.create(:user,
                                    first_name: '',
                                    last_name: '') }

    it 'should return "User" as display name' do
      expect(user.display_name).to eq('User')
    end
  end
end
