class AddForeignKeyForUsersInCustomers < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :customers, :users, column: :user_id
  end
end
