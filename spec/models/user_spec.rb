require 'rails_helper'

describe User do
  let (:user) { User.new(name: 'John') }

  describe '#name' do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe '#phone_number' do
    it { is_expected.to validate_presence_of(:phone_number) }

    it 'is not valid if it does not have a \'+\' as a prefix' do
      user.phone_number = '1234567890'
      expect(user).not_to be_valid
    end

    it 'is not valid if it does not have at least 8 numbers' do
      user.phone_number = '+1234567'
      expect(user).not_to be_valid

      user.phone_number = '+12345678'
      expect(user).to be_valid
    end
  end
end


