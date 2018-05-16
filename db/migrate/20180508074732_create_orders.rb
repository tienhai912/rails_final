class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.decimal :price
      t.boolean :active

      t.timestamps
    end
  end
end
