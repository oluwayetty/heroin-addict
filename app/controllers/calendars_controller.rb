class CalendarsController < ApplicationController

  def show
    @current_day = DateTime.now.to_date
    @days = current_user.journals.pluck(:created_at).map(&:to_date).uniq.map { |date| Day.new(date) }
  end

end
