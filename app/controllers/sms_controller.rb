class SmsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def receive
    # let's pretend that we've mapped this action to 
    # http://localhost:3000/sms in the routes.rb file

    message_body = params["Body"]
    from_number = params["From"]

    analyzer = Twilio::Analyzer.new(sms: params)
    analyzer.read_sms_and_create_message!

    messenger = Twilio::Messenger.new(recipient: analyzer.sender, message: analyzer.response)
    messenger.send

  end
end
