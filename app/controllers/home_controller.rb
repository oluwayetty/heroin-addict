class HomeController < ApplicationController
  def index
    @last_moods = current_user.daily_moods.last(2).pluck(:mood).uniq
    @low_status = @last_moods.any? { |s| ['Depressed', 'Bad'].any? { |t| s.include?(t) } }
  end

  def about
  end
end
