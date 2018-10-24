class Message < ApplicationRecord
  belongs_to :user

  attr_accessor :text_errors

  def process!
    nil
  end

  def response
    ''
  end

  def to_be_broadcasted?
    true
  end

  def user_and_time_desc
    "#{user.name}, on #{received_at.strftime('%b %-d %Y, %-l:%M%p')}"
  end
end
