module BookExtension
  def validbooks
      where.not(name: nil)
  end
end

class Author < ApplicationRecord
  # has_many :books
  # has_many :books, validate: true
  has_many :books, extend: BookExtension
end
