class JournalsController < ApplicationController
  include JournalHelper
  before_action :set_journal, only: [:show, :edit, :update]
  respond_to :html, :json

  def index
    @journals = current_user.journals.each_with_object({}) do |journal, hsh|
      #select only the last journal created by a date
      hsh[journal.created_at.to_date] = journal
    end.values
  end

  def show
    @journal = Journal.find_by(subject: params[:subject])
    date_created = @journal.created_at.to_date
    @all_journals = current_user.journals.where("date(created_at) = ?", date_created)
  end

  def new
  end

  def edit
    unless same_date?(@journal)
      redirect_to journals_path
      flash[:alert] = "Oops, but you can't edit a journal after 24 hours it was created"
    end
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

  def update
    if @journal.update(journal_params)
      redirect_to journals_path
      flash[:notice] = "Your journal for today was successfully updated"
    else
      flash[:alert] = "There was an error updating your new journal record"
      redirect_to new_journal_path
    end
  end

  private
  def journal_params
    params.require(:journal).permit(:subject, :body)
  end

  def set_journal
    @journal = Journal.find_by(subject: params[:subject])
    # @journal = Journal.find(params[:id])
  end
end
