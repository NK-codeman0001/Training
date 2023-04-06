class Book < ApplicationRecord
  # belongs_to :author, foreign_key: true
  # belongs_to :author, touch: true
  belongs_to :author, optional: true

  # validates :name, presence: true
  
  
end
