class Report < Message

  def process!
    save!
  end

  def response
    "Thanks, your report (##{id}) has been registered."
  end

end
