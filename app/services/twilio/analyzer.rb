module Twilio
  class Analyzer
    attr_accessor :sms, :sender, :response

    def initialize(sms: nil)
      @sms = sms
    end

    def read_sms_and_create_report!
      phone_number = sms['From']
      user = User.find_by_phone_number(phone_number)
      @sender = user

      full_message = sms['Body']
      action = full_message.split.first
      description = full_message.split[1..full_message.length].join(' ')

      report = action.capitalize.constantize.new(user: user, description: description)
      report.save!

      @response = "Thanks #{user.name}, #{action.capitalize} registered"

    end
  end
end
