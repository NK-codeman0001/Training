class AddUsersBelongsToCustomers < ActiveRecord::Migration[7.0]
  def change
    add_belongs_to :customers, :users, polymorphic: true
  end
end
