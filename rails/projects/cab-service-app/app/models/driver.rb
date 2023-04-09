class Driver < ApplicationRecord
  has_many :trips
  has_many :payments
  has_many :reviews


  validates :name, :email, :password, :car_make, :car_model, :car_license_plate, presence: true
  validates :email, uniqueness: true
  
end
