class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :category_id
      t.datetime :publish_date
      t.string :author
      t.integer :pages
      t.string :cover
      t.text :description

      t.timestamps
    end
  end
end
