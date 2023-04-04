class Author < ApplicationRecord
  # has_many :books
  has_many :books, validate: true
  
end
