class Category < ApplicationRecord
  belongs_to :item
  has_many :sizes
  has_ancestry 
end
