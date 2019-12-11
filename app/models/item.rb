class Item < ApplicationRecord
  has_many :images, :dependent => :destroy
  accepts_nested_attributes_for :images
  # 後ほど機能追加のためコメントスアウト
  # has_many :users, through: :users_items
  # # has_many :comments
  # has_many :categories
  # has_many :likes
  has_many :regions
  accepts_nested_attributes_for :regions

  #userテーブルの「id」とitemsテーブルの「buyer_id」「saler_id」を紐付ける
  belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User"

  validates :seller_id,{presence:true}


  def seller
    return User.find(self.seller_id)
  end

  def previous
    Item.where("id < ?",id).order("id DESC").first
  end

  def next
    Item.where("id > ?", id).order("id ASC").first
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

end
