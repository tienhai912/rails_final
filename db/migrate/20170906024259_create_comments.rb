class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.string :sub_comment_type
      t.integer :sub_comment_id
      t.text :content

      t.timestamps
    end
  end
end
