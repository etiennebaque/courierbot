class UserMessageChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'user_message_need'
    #stream_for current_admin
  end
end
