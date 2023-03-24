class ExecuteMethod < ActiveRecord::Migration[7.0]
  def change
    Product.connection.execute("ALTER TABLE products DROP COLUMN part_number")
  end
end
