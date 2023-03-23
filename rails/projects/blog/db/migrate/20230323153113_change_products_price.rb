class ChangeProductsPrice < ActiveRecord::Migration[7.0]
  def up 
     change_table :products do |t|
      t.change :price, :string
     end
  end

  def down
    change_table :products do |t|
      t.change :price, :integer
    end
  end
end

# class ChangeProductsPrice < ActiveRecord::Migration[7.0]
#   def change
#     reversible do |dir|
#       change_table :products do |t|
#         dir.up {t.change :price, :string}
#         dir.down {t.change :price, :integer}
#       end
#     end
#   end
# end
