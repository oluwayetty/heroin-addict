class CalendarsController < ApplicationController

  def show
    @days = current_user.journals.pluck(:created_at).map(&:to_date).uniq.map { |date| Day.new(date) }
    # @journals = current_user.journals.each_with_object({}) do |journal, hsh|
    #   #select only the last journal created by a date
    #   hsh[journal.created_at.to_date] = journal
    # end.values
  end
end
