class CreateBookmarks < ActiveRecord::Migration[5.0]
  def change
    create_table :bookmarks do |t|
      t.integer :user_id
      t.integer :book_id
      t.boolean :favorite
      t.integer :status
      t.datetime :start_read
      t.datetime :finish_read

      t.timestamps
    end
  end
end
