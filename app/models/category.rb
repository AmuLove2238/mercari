class Category < ApplicationRecord
  belong_to: item
  has_many: sizes
end
