class Book < ApplicationRecord
  # belongs_to :author, foreign_key: true
  # belongs_to :author, touch: true
  belongs_to :author, optional: true

  # validates :name, presence: true

  scope :recent_books, -> {where(created_at: (Time.now - 1.day)..Time.now )}
  scope :recent_books_with_author, -> {recent_books.where.not(author_id: nil)}

  default_scope {order(:author_id)}
  
end
