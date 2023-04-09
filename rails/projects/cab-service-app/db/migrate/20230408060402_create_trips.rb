class CreateTrips < ActiveRecord::Migration[7.0]
  def change
    create_table :trips do |t|
      t.datetime :pickup_time
      t.string :status
      t.float :fare
      t.belongs_to :driver
      t.belongs_to :user
      t.belongs_to :dropoff_location, class_name: "Location"
      t.belongs_to :pickup_location, class_name: "Location"

      t.timestamps
    end
  end
end
