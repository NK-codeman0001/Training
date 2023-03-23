class ChangeColumns < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :name, :string
    add_column :products, :approved, :boolean, default: true
    change_column :products, :part_number, :text
  end
end
