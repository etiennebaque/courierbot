class Report < Message

  STREAM_NAME = 'user_message_report'

  def process!
    save!
  end

  def response
    "Thanks, your report (##{id}) has been registered."
  end

end
