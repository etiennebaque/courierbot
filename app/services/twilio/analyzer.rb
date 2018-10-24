module Twilio
  class Analyzer
    attr_accessor :phone_number, :sms_body, :message

    def initialize(sms: nil)
      raise 'Please pass in a sms' if sms.nil?
      @phone_number = sms['From']
      @sms_body = sms['Body']
    end

    def read_sms_and_create_message!
      return unless sms_valid?

      description = @sms_body.split[1..sms_body.length].join(' ')
      @message = action_class.new(user: sender, 
                                  description: description, 
                                  received_at: datetime_now_with_time_zone)
      @message.process!
    end

    def broadcast_message
      return unless sms_valid? && broadcast?

      channel_stream = @message.class::STREAM_NAME
      highlight = @message.class::HIGHLIGHT_COLOR
      ActionCable.server.broadcast(channel_stream,
                                   id: "msg-#{@message.id}",
                                   highlight: highlight,
                                   description: @message.description,
                                   user_time: @message.user_and_time_desc,
                                   username: sender.name,
                                   type: @message.class.name.downcase)
    end

    def action_valid?
      action_class.try(:present?)
    end

    def known_sender?
      sender.present?
    end

    def sender
      @sender ||= User.find_by_phone_number(@phone_number)
    end

    private

    def broadcast?
      @message.to_be_broadcasted?
    end

    def sms_valid?
      action_valid? && known_sender?
    end

    def action_class
      action_text = @sms_body.split.first.try(:capitalize)
      action_text.constantize rescue nil
    end

    def datetime_now_with_time_zone
      DateTime.now.in_time_zone("Eastern Time (US & Canada)")
    end
  end
end
