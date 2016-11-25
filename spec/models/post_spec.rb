require 'rails_helper'

RSpec.describe Post, type: :model do
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:body) }
  it { is_expected.to validate_presence_of(:user_id) }
  it { is_expected.to validate_length_of(:title).is_at_most(255).is_at_least(2) }
  it { is_expected.to validate_length_of(:body).is_at_most(6555).is_at_least(10) }
end
