class CreateTable < ActiveRecord::Migration[5.0]
  def change
    create_table :daily_moods do |t|
      t.integer :user_id
      t.string :mood
      t.timestamps
    end
  end
end
