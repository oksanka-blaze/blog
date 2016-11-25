require 'rails_helper'

RSpec.describe Post, type: :model do
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:body) }
  it { is_expected.to validate_presence_of(:user_id) }
  it { is_expected.to validate_length_of(:title).is_at_most(255).is_at_least(2) }
  it { is_expected.to validate_length_of(:body).is_at_most(6555).is_at_least(10) }

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
