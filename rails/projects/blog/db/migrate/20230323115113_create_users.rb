class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :gender
      t.integer :age
      t.text :address
      t.boolean :terms_and_conditions, default: 'false'

      t.timestamps
    end
  end
end
