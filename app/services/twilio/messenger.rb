module Twilio
  class Messenger
    attr_accessor :analyzer

    def initialize(analyzer: nil)
      @analyzer = analyzer
    end

    def send
      client = Twilio::REST::Client.new
      client.messages.create(
        {
          from: Rails.application.secrets.twilio_phone_number,
          to: analyzer.phone_number,
          body: message_to_send
        }
      )
    end

    private

    def message_to_send
      return "Sorry, you're not a registered user. Please contact your Courier Bot admin." unless @analyzer.known_sender?
      return "Sorry, message invalid. Send \"#{Help::TRIGGER_SMS_TEXT}\" to get a list of valid commands." unless @analyzer.action_valid?
      @analyzer.message.response
    end
  end
end
