class Item < ApplicationRecord
  has_many :images, :dependent => :destroy
  accepts_nested_attributes_for :images
  # accepts_nested_attributes_for :postages
  # has_many :users, through: :users_items
  # has_many :comments
  # has_many :categories
  # has_many :conditions
  has_many :postages
  has_many :regions
  # has_many :likes
  # has_many :comments
  # accepts_nested_attributes_for :region
end
