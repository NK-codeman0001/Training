class CreateCustomer < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :name, comment: "User's Full Name"
      t.boolean :active, default: false
      t.text :summary, limit: 250
      t.string :email, null: false, unique: true
      t.decimal :spend, precision:10, scale:2, comment: "in Thousand INR"
      t.index :name


      t.timestamps
    end
  end
end
