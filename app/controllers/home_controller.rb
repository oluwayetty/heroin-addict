class HomeController < ApplicationController
  def index
    @last_moods = current_user.daily_moods.last(2).pluck(:mood).uniq
    @low_status = @last_moods.include? "Depressed" || "Bad"
  end
end
