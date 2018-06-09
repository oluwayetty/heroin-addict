class AddUserIdToLetters < ActiveRecord::Migration[5.0]
  def change
    add_reference :letters, :user, foreign_key: true
    add_index :users, :username, unique: true
  end
end
