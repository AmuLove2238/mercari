class Address < ApplicationRecord
  belongs_to :user, optional: true


  VALID_POSTAL_CODE = /\A\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}\z/
  KANA_VALIDATION = /\A[\p{katakana}\p{blank}ー－]+\z/
  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/

  validates :address_family_name_kanji,    presence: true
  validates :address_first_name_kanji,     presence: true
  validates :address_family_name_kana,     presence: true, format: { with: KANA_VALIDATION, message: 'はカタカナで入力して下さい。'}
  validates :address_first_name_kana,      presence: true, format: { with: KANA_VALIDATION, message: 'はカタカナで入力して下さい。'}
  validates :postal_code,                  presence: true, format: { with: VALID_POSTAL_CODE }
  validates :region_id,                    presence: true
  validates :city,                         presence: true
  validates :district_number,              presence: true
  validates :address_phone_number,         format: {with: VALID_PHONE_REGEX }, if: "address_phone_number.present?"

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end
