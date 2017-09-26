class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.string :noti_activity_type
      t.integer :noti_activity_id
      t.integer :receiver_id
      t.integer :sender_id
      t.text :content

      t.timestamps
    end
  end
end
