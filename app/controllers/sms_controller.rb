class SmsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def receive
    analyzer = Twilio::Analyzer.new(sms: params)
    analyzer.read_sms_and_create_message!
    analyzer.broadcast_message

    messenger = Twilio::Messenger.new(analyzer: analyzer)
    messenger.send
  end
end
