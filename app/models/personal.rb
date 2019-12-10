class Personal < ApplicationRecord
  belongs_to :user, optional: true

  #バリデーション
  KANA_VALIDATION = /\A[ァ-ヶー－]+\z/

  validates :family_name_kanji,      presence: true
  validates :first_name_kanji,       presence: true
  validates :family_name_kana,       presence: true,  format: { with: KANA_VALIDATION, message: 'はカタカナで入力して下さい。' }
  validates :first_name_kana,        presence: true,  format: { with: KANA_VALIDATION, message: 'はカタカナで入力して下さい。' }
  validates :birthday,               presence: true
  # :icon
  # :introduction
      
end