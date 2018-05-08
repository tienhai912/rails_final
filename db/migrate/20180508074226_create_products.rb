class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.integer :quantity
      t.float :price
      t.string :image
      t.string :ISBN
      t.string :code
      t.float :screen_size
      t.string :resolution
      t.string :CPU
      t.integer :RAM
      t.string :branch
      t.boolean :graphic_card

      t.timestamps
    end
  end
end
