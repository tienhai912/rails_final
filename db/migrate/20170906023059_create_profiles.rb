class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.integer :phone
      t.string :avartar
      t.datetime :birthday

      t.timestamps
    end
  end
end
