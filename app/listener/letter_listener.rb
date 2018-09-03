class LetterListener
  def letter_created(letter, url)
    sender = letter.sender.capitalize
    phone_number = "+" + letter.user.phone_number
    short_url = shorten_url(url)
    message = "You've got a new letter from #{sender}. Click #{short_url} to view it."
    send_message(phone_number, message)
  end

  private

  def send_message(phone_number, message)
    @twilio_number = ENV['TWILIO_NUMBER']
    @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']

    message = @client.messages.create(
      :from => @twilio_number,
      :to => phone_number,
      :body => message,
    )
  end

  def shorten_url(url)
    if Rails.env.development?
      url
    else
      Bitly.client.shorten(url)
    end    
  end
end
