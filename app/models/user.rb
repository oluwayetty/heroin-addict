class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :daily_moods
  has_many :journals
  has_many :letters
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_many :chatroom_users
  has_many :chatrooms, through: :chatroom_users
  has_many :messages

  def has_a_mood_record_for_today?
    current_date = DateTime.now.to_date
    daily_moods.where("date(created_at) = ?", current_date).present?
  end
end
