class CreateNewTable < ActiveRecord::Migration[7.0]
  def change
    create_table :new_tables, id: false do |t|
      t.string :email, primary_key: true
      t.string :name
      t.integer :age

      t.timestamps
    end
  end
end
