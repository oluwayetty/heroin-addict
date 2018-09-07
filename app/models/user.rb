class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :daily_moods
  has_many :journals
  has_many :letters
  has_and_belongs_to_many :visible_journals, class_name: 'Journal', join_table: 'journal_viewers'
  has_and_belongs_to_many :addicts,
    class_name: 'User', join_table: 'supported_users',
    foreign_key: 'supporter_id', association_foreign_key: 'addict_id'

  has_and_belongs_to_many :supporters,
    class_name: 'User', join_table: 'supported_users',
    foreign_key: 'addict_id', association_foreign_key: 'supporter_id'

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :phone_number, presence: true, numericality: { only_integer: true }
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_many :chatroom_users
  has_many :chatrooms, through: :chatroom_users
  has_many :messages
  has_many :statuses

  def has_a_mood_record_for_today?
    current_date = DateTime.now.to_date
    daily_moods.where("date(created_at) = ?", current_date).present?
  end

  def self.options_for_select
    order('LOWER(username)').map { |e| [e.username, e.id] }
  end
end
