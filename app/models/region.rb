class Region < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item
  # belongs_to :address
  belongs_to_active_hash :prefecture
end
