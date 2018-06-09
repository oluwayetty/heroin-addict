class AddSenderToLetters < ActiveRecord::Migration[5.0]
  def change
    add_column :letters, :recipient_id, :integer
    add_column :letters, :recipient, :string
    add_column :letters, :sender, :string
    add_column :letters, :subject, :string
    add_column :letters, :body, :text
  end
end
