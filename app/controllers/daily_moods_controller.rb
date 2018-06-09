class DailyMoodsController < ApplicationController

  def create
    current_user.daily_moods.create(daily_moods_params)
    redirect_to root_path
    flash[:notice] = "Your daily mood for today has been recorded"
  end

  def daily_moods_params
    params.require(:daily_mood).permit(:mood)
  end
end
