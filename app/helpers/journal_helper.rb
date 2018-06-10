module JournalHelper
  def same_date?(journal)
    DateTime.now.end_of_day.to_date == journal.created_at.to_date
  end
end
