class Cledit < ApplicationRecord
  belongs_to :user, optional: true
end
