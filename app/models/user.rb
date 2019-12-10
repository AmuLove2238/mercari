class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable#, :validatable

  has_one :personal, dependent: :destroy
  accepts_nested_attributes_for :personal
  has_one :phonenumber, dependent: :destroy
  accepts_nested_attributes_for :phonenumber
  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address
  has_one :card, dependent: :destroy
  accepts_nested_attributes_for :card

  #バリデーション
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :nickname,                presence: true, length: {maximum: 20}, uniqueness: true
  validates :email,                   presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password,      presence: true, length: {minimum: 7, maximum: 128}

  
end
