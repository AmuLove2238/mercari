class Item < ApplicationRecord
  # accepts_nested_attributes_for :postages
  # accepts_nested_attributes_for :regions

  has_many :images
  has_many :users, through: :users_items
  has_many :comments
  has_many :categories
  has_many :conditions
  has_many :postages
  has_many :regions
  has_many :likes
  has_many :comments

  mount_uploader :image, ImageUploader
end
