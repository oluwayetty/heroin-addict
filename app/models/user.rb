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
end
