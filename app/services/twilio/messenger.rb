module Twilio
  class Messenger
    attr_accessor :recipient, :message

    def initialize(recipient: nil, message: nil)
      @recipient = recipient
      @message = message
    end

    def send
      client = Twilio::REST::Client.new
      client.messages.create(
        {
          from: Rails.application.secrets.twilio_phone_number,
          to: recipient.phone_number,
          body: message
        }
      )
    end
  end
end
