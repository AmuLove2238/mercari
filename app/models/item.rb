class Item < ApplicationRecord
  has_many :images, :dependent => :destroy
  accepts_nested_attributes_for :images
  # 後ほど機能追加のためコメントスアウト
  # has_many :users, through: :users_items
  # has_many :comments
  # has_many :categories
  # has_many :likes
  has_many :regions
  accepts_nested_attributes_for :regions
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

end
