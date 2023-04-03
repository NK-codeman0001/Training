class Book < ApplicationRecord
  belongs_to :author, foreign_key: true
end
