require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:email) }
  it { is_expected.to validate_presence_of(:password) }
  it { is_expected.to validate_length_of(:first_name).is_at_most(25).is_at_least(2) }
  it { is_expected.to validate_length_of(:last_name).is_at_most(25).is_at_least(2) }
end
