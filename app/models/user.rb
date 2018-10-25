class User < ApplicationRecord
  validates :name, :phone_number, presence: true
  validate :phone_number_format

  def phone_number_format
    unless phone_number =~ /\A[+]\d{8,}\z/
      errors.add(:phone_number, 'is not valid.')
    end  
  end
end
