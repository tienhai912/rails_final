class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.string :like_activity_type
      t.integer :like_activity_id

      t.timestamps
    end
  end
end
