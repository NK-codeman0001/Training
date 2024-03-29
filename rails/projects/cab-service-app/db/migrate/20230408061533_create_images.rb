class CreateImages < ActiveRecord::Migration[7.0]
  def change
    create_table :images do |t|
      t.string :url
      t.belongs_to :imageable, polymorphic: true

      t.timestamps
    end
  end
end
