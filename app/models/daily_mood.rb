class DailyMood < ApplicationRecord
  MOOD = ["Great", "Fine", "Not well", "Bad", "Depressed"].freeze
  belongs_to :user
end
