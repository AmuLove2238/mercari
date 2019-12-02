class Region < ApplicationRecord
  belong_to: item
  belong_to: address
end
