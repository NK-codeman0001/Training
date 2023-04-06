class AddGenderToAuthors < ActiveRecord::Migration[7.0]
  def change
    add_column :authors, :gender, :integer
  end
end
