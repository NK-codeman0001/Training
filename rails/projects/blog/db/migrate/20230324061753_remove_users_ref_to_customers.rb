class RemoveUsersRefToCustomers < ActiveRecord::Migration[7.0]
  def change
    remove_reference :customers, :users, foreign_key: true, index: false
  end
end
