class RemoveForeignKeyForUsersInCustomers < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :customers, :users
  end
end
