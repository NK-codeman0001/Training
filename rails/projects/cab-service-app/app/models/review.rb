class Review < ApplicationRecord
  belongs_to :user
  belongs_to :driver



  validates :rating, presence: true, inclusion: {in: 1..5}, numericality: {only_integer: true}
end
