class Category < ApplicationRecord
  belongs_to :item
  has_many :sizes
end
