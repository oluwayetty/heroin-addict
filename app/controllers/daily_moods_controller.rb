class DailyMoodsController < ApplicationController

  def create
    if current_user.has_a_mood_record_for_today?
      redirect_to root_path
      flash[:alert] = "Oops, you can only create one entry for your DailyMood per day. Check back tomorrow"
    else
      current_user.daily_moods.create(daily_moods_params)
      redirect_to root_path
      flash[:notice] = "Your daily mood for today has been recorded"
    end
  end

  def daily_moods_params
    params.require(:daily_mood).permit(:mood)
  end
end
