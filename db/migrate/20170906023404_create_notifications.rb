class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.string :type
      t.integer :type_id
      t.integer :receiver_id
      t.integer :sender_id
      t.text :content

      t.timestamps
    end
  end
end
