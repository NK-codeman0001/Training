class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.float :amount
      t.string :payment_method
      t.belongs_to :user
      t.belongs_to :driver

      t.timestamps
    end
  end
end
