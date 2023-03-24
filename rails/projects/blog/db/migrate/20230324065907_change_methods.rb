class ChangeMethods < ActiveRecord::Migration[7.0]
  def up
    add_column :xxxes, :email, :string
    add_column :xxxes, :customer_id, :integer
    add_foreign_key :xxxes, :customers
    add_index :xxxes, :name
    add_reference :xxxes, :users
    add_timestamps :products_users
    change_column_comment :xxxes, :name,"new comment added"
    change_column_default :xxxes, :email,"example@mail.com"
    change_column_null :xxxes, :name, false
    change_table_comment :xxxes,"New Table Comment"
    create_join_table :xxxes, :customers
    create_table :admin do |t|
      t.string :name
      t.integer :age
      t.boolean :is_admin, default: false
      t.timestamps
    end
    enable_extension 'hstore'
    rename_column :xxxes, :part_number, :number
    rename_index :xxxes,"index_xxxes_on_name","index_xxxes_on_new_name"
    rename_table :xxxes, :test_table
  end

  def down
    rename_table :test_table,:xxxes
    rename_index :xxxes,"index_xxxes_on_new_name","index_xxxes_on_name"
    rename_column :xxxes, :number, :part_number
    disable_extension 'hstore'
    drop_table :admin
    drop_join_table :xxxes,:customers
    change_table_comment :xxxes, from: "New Table Comment", to: ""
    change_column_null :xxxes, :name, true
    change_column_default :xxxes, :email, from: "example@mail.com", to: ""
    change_column_comment :xxxes, :name, from: "new comment added", to: ""
    remove_timestamps :products_users
    remove_reference :xxxes, :users
    remove_index :xxxes, :name
    remove_foreign_key :xxxes, :customers
    remove_column :xxxes, :customer_id, :integer
    remove_column :xxxes, :email, :string  
  end
end
