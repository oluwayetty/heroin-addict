class Letter < ApplicationRecord
  belongs_to :user

  def self.letters_grouped_by_recipient_id(id)
    where(recipient_id: id)
  end

  def self.letters_grouped_by_sender_name(username)
    where(sender: username)
  end
end
