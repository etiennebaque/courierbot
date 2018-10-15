module Twilio
  class Analyzer
    attr_accessor :sms, :sender, :response

    def initialize(sms: nil)
      @sms = sms
    end

    def read_sms_and_create_message!
      phone_number = sms['From']
      user = User.find_by_phone_number(phone_number)
      @sender = user

      full_message = sms['Body']
      action_text = full_message.split.first

      action_class = action_text.capitalize.try(:constantize)
      if action_class.present?
        description = full_message.split[1..full_message.length].join(' ')
        action = action_class.new(user: user, description: description)
        action.process!
        @response = action.response
      end


    end

  end
end
