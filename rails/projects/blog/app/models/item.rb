class Item < ApplicationRecord
  has_many :pictures, as: :imageable
end
