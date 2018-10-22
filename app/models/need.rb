class Need < Message

  STREAM_NAME = 'user_message_need'
  HIGHLIGHT_COLOR = '#90f431'

  def process!
    save!
  end

  def response
    "Thanks, your need (##{id}) has been registered."
  end

end
