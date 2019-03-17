class Help < Message

  TRIGGER_SMS_TEXT = 'help me'

  def response
    "Courier bot - Help \n - To request a need, send: \n need <description of your request> \n - To report an event, send: \n report <description of the event>"
  end

  def to_be_broadcasted?
    false
  end

  def trigger_sms_text
    TRIGGER_SMS_TEXT
  end
end
