class Chatroom < ApplicationRecord
  has_many :chatroom_users, dependent: :destroy
  has_many :users, through: :chatroom_users
  has_many :messages, dependent: :destroy
  accepts_nested_attributes_for :users

  scope :public_channels, ->{ where(direct_message: false) }
  scope :direct_messages, ->{ where(direct_message: true) }

  def self.direct_message_for_users(users)
    user_names = users.map(&:username).sort
    name = "DM #{user_names.join("-")}"

    if chatroom = direct_messages.where(name: name).first
      chatroom
    else
      # create a new chatroom
      chatroom = new(name: name, direct_message: true)
      chatroom.users = users
      chatroom.save
      chatroom
    end
  end
end
