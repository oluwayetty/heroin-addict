module LettersHelper

  def formatted_date(date=Date.today)
    date.strftime("%d/%m/%Y")
  end

  def formatted_time(time= Time.now)
    time.strftime("%H:%M")
  end
end
