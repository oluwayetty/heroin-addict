class AddCreatorToChatrooms < ActiveRecord::Migration[5.0]
  def change
    add_column :chatrooms, :creator_id, :integer
  end
end
