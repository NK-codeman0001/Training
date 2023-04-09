class User < ApplicationRecord
  has_many :trips
  has_many :payments
  has_many :reviews


  validates :name, :email, :password, presence: true
  validates :email, uniqueness: true
end
