class Report < Message

  STREAM_NAME = 'user_message_report'
  HIGHLIGHT_COLOR = '#90fcff'

  def process!
    save!
  end

  def response
    "Thanks, your report (##{id}) has been registered."
  end

end
