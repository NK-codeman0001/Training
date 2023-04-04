class Book < ApplicationRecord
  # belongs_to :author, foreign_key: true
  belongs_to :author, touch: true
end
