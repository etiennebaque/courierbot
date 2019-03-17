require 'rails_helper'

describe Message do
  let (:user) { User.create(name: 'John', phone_number: '+12223334444') }
  let (:message) { Message.new(user_id: user.id) }

  describe '#user_and_time_desc' do
    it 'returns the correct description' do
      date_now = DateTime.now
      message.received_at = date_now
      desc = "John, on #{message.date_time_desc} UTC"

      expect(message.user_and_time_desc).to eq desc
    end
  end
end
