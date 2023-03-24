class ChangeColumnsConstraint < ActiveRecord::Migration[7.0]
  def change
    change_column_null :products, :name, false
    change_column_default :products, :approved, from: true, to: false
  end
end
