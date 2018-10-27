class Need < Message

  STREAM_NAME = 'user_message_need'

  def process!
    save!
  end

  def response
    "Thanks, your need (##{id}) has been registered."
  end

end
