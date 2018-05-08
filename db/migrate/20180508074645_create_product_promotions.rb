class CreateProductPromotions < ActiveRecord::Migration[5.1]
  def change
    create_table :product_promotions do |t|
      t.integer :promotion_id
      t.integer :product_id

      t.timestamps
    end
  end
end
