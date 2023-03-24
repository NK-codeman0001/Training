class AddUsersRefToCustomers < ActiveRecord::Migration[7.0]
  def change
    add_reference :customers, :users
  end
end
