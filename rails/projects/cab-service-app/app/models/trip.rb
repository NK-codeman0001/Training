class Trip < ApplicationRecord
  belongs_to :user
  belongs_to :driver
  belongs_to :pickup_location, class_name: "Location"
  belongs_to :dropoff_location, class_name: "Location"


  validates :pickup_time,:status,:fare, presence: true
  validates :status, inclusion: {in: %w(requested accepted in-progress completed)}
end
