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
end
