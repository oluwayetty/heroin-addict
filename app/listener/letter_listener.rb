class LetterListener
  def letter_created(letter, url)
    phone_number = letter.user.phone_number
    message = "You've got a new letter #{url}"
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
    # puts message.to, message.body
  end
end
