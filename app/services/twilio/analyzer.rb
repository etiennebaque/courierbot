module Twilio
  class Analyzer
    attr_accessor :sms, :sender, :message

    def initialize(sms: nil)
      @sms = sms
    end

    def read_sms_and_create_message!
      phone_number = @sms['From']
      @sender = User.find_by_phone_number(phone_number)

      full_message = sms['Body']
      action_text = full_message.split.first
      action_class = action_text.capitalize.try(:constantize)
      return unless action_class.present?

      description = full_message.split[1..full_message.length].join(' ')
      @message = action_class.new(user: @sender, description: description)
      @message.process!
    end

    def broadcast_message
      channel_stream = @message.class::STREAM_NAME
      highlight = @message.class::HIGHLIGHT_COLOR
      ActionCable.server.broadcast(channel_stream,
                                   id: "msg-#{@message.id}",
                                   highlight: highlight,
                                   description: @message.description,
                                   username: @sender.name,
                                   city: @sender.deployment.city,
                                   type: @message.class.name.downcase)
    end
  end
end
