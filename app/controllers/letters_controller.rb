class LettersController < ApplicationController
  before_action :verify_supporters, except: [:index,:show]

  def index
    current_user.supporter? ? @letters = Letter.letters_grouped_by_sender_name(current_user.username) : @letters = Letter.letters_grouped_by_recipient_id(current_user.id)
  end

  def show
    @letter = Letter.find(params[:id])
  end

  def new
  end

  def create
    @new_letter = current_user.letters.build(letter_params)
    if @new_letter.valid?
      recipient_id = User.find_by(username: @new_letter.recipient).id
      Letter.create!(
        subject: @new_letter.subject,
        sender: current_user.username,
        recipient: @new_letter.recipient,
        recipient_id: recipient_id,
        body: @new_letter.body,
        user: current_user
      )
      redirect_to letters_path
      flash[:notice] = "Your letter has been created successfully and sent to"
    else
      flash[:alert] = "Oops, there was an error composing the letter"
      redirect_to new_letter_path
    end
  end

  private

  def letter_params
    params.require(:letter).permit(:user, :subject, :body, :recipient, :sender)
  end

  def verify_supporters
    # flash[:alert] = "Unauthorized"
    # redirect_to root_path unless current_user.supporter?
    unless current_user.supporter?
      redirect_to root_path, alert: "Unauthorized to view this page"
    end
  end

end
