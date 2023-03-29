class DropTables < ActiveRecord::Migration[7.0]
  def change
    drop_table :test_table
    drop_table :admin
    drop_table :customers_xxxes
    drop_table :customers
    drop_table :new_tables
    drop_table :products
    drop_table :products_users
    
  end
end
