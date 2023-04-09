class Location < ApplicationRecord
  has_many :trips, as: :pickup_location, class_name: "Trip", foreign_key: :pickup_location_id
  has_many :trips, as: :dropoff_location, class_name: "Trip", foreign_key: :dropoff_location_id 

  validates :name, :address, :latitude, :longitude, presence: true
  validates :address, uniqueness: true
end
