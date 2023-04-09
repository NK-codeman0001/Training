class CreateDrivers < ActiveRecord::Migration[7.0]
  def change
    create_table :drivers do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :car_make
      t.string :car_model
      t.string :car_license_plate

      t.timestamps
    end
  end
end
