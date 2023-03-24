class AddPrimaryKeyToAdmin < ActiveRecord::Migration[7.0]
  def change
    remove_column :admin, :id
    add_column :admin, :emp_id, :integer, primary_key: true
  end
end
