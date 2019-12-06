class Region < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item
  # ユーザーと結びつける際アソシエーションで必要
  # belongs_to :address
  belongs_to_active_hash :prefecture
end
