require 'rails_helper'

RSpec.describe User, type: :model do
  # Validations
  describe 'validations' do
    subject { build(:user) }

    it { is_expected.to validate_presence_of(:nickname) }
    it { is_expected.to validate_uniqueness_of(:nickname) }

    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive.scoped_to(:provider) }
    it { is_expected.to allow_value('email@example.com').for(:email) }
    it { is_expected.to_not allow_value('email.com').for(:email) }

    it { is_expected.to validate_presence_of(:preferred_hand) }
    it { is_expected.to validate_presence_of(:gender) }
  end

  # Enums
  describe 'enums' do
    it { is_expected.to define_enum_for(:role).with_values(player: 0, admin: 1) }
    it { is_expected.to define_enum_for(:preferred_hand).with_values(right: 0, left: 1) }
    it { is_expected.to define_enum_for(:gender).with_values(male: 0, female: 1, other: 2) }
  end

  # Factory
  describe 'factory' do
    it 'has a valid factory' do
      expect(build(:user)).to be_valid
    end
  end

  # Email validation tests
  describe 'email validation' do
    it 'is valid with a correct email format' do
      user = build(:user, email: 'user@example.com')
      expect(user).to be_valid
    end

    it 'is invalid with an incorrect email format' do
      user = build(:user, email: 'user@com')
      expect(user).not_to be_valid
      expect(user.errors[:email]).to include('is not a valid email')
    end
  end
end
