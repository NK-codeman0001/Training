class CreateXxx < ActiveRecord::Migration[7.0]
  def change
    create_table :xxxes do |t|
      t.string :name
      t.string :part_number

      t.timestamps
    end
  end
end
