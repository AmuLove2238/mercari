class Phonenumber < ApplicationRecord
  belongs_to :user, optional: true

  
  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/

  validates :phone_number, presence: true, format: { with: VALID_PHONE_REGEX }
end
