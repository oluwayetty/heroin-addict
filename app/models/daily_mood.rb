class DailyMood < ApplicationRecord
  MOOD = ["Fine", "Not well", "Great", "Bad", "Depressed"].freeze
  belongs_to :user
end
