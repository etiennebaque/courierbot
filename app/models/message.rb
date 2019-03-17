class Message < ApplicationRecord
  belongs_to :user

  attr_accessor :text_errors

  DATE_TIME_FORMAT = '%b %-d %Y, %-l:%M%p'

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
    "#{user.name}, on #{date_time_desc} UTC"
  end

  def date_time_desc
    received_at.strftime(DATE_TIME_FORMAT)
  end

  def date_format
    DATE_TIME_FORMAT
  end
end
