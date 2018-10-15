class Message < ApplicationRecord
  belongs_to :user

  def process!
    nil
  end

  def response
    ''
  end
end
