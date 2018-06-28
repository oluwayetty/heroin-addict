class CreateSupportedUsers < ActiveRecord::Migration[5.0]
  create_table :supported_users do |t|
    t.integer :supporter_id
    t.integer :addict_id
    t.timestamps null: true
  end
  add_index :supported_users, %i[supporter_id addict_id], unique: true
end
