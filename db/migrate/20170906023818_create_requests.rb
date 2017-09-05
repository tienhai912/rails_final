class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.integer :user_id
      t.string :title
      t.integer :category_id
      t.datetime :publish_date
      t.string :author
      t.integer :pages
      t.string :cover
      t.text :description
      t.integer :status
      t.integer :admin_id
      t.text :admin_note

      t.timestamps
    end
  end
end
