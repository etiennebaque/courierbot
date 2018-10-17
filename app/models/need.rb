class Need < Message

  def process!
    save!

  end

  def response
    "Thanks, your need (##{id}) has been registered."
  end

end
