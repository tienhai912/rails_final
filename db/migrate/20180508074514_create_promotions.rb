class CreatePromotions < ActiveRecord::Migration[5.1]
  def change
    create_table :promotions do |t|
      t.float :percent
      t.string :description
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
