class UserMessageChannel < ApplicationCable::Channel
  def subscribed
    stream_from Need::STREAM_NAME
    stream_from Report::STREAM_NAME
  end
end
