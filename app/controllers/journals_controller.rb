class JournalsController < ApplicationController

  def index
    @journals = current_user.journals
  end

  def show
    @journal = Journal.find(params[:id])
  end

  def new
  end

  def create
    @new_journal = current_user.journals.build(journal_params)
    if @new_journal.save
      redirect_to journals_path
      flash[:notice] = "Your journal for today was successfully created"
    else
      flash[:alert] = "There was an error creating your new journal record"
      redirect_to new_journal_path
    end
  end

  private
  def journal_params
    params.require(:journal).permit(:subject, :body)
  end
end
