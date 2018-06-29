class JournalsController < ApplicationController
  include JournalHelper
  before_action :set_journal, only: %i[edit update]
  before_action :set_supporters, except: :index
  respond_to :html, :json

  def index
    date_created = params[:day]
    @journals = current_user.journals.where("date(created_at) = ?", date_created)
  end

  def edit
    unless same_date?(@journal)
      redirect_to calendar_path
      flash[:alert] = "Oops, but you can't edit a journal after 24 hours it was created"
    end
  end

  def new
    @journal = current_user.journals.build
  end

  def create
    @journal = current_user.journals.build(journal_params)
    if @journal.save
      redirect_to calendar_path
      flash[:notice] = "Your journal for today was successfully created"
    else
      flash[:alert] = "There was an error creating your new journal record"
      redirect_to new_journal_path
    end
  end

  def update
    if @journal.update(journal_params)
      redirect_to calendar_path
      flash[:notice] = "Your journal for today was successfully updated"
    else
      flash[:alert] = "There was an error updating your new journal record"
      redirect_to new_journal_path
    end
  end

  def visible_journals
    binding.pry
    unless current_user.supporter?
      redirect_to root_path
      flash[:alert] = "Unauthorized to view the page"
    end
    @visible_journals = current_user.visible_journals
  end

  private
  def journal_params
    viewer_ids = (params[:viewers] || {}).keys
    viewers = @supporters.where(id: viewer_ids)
    params.require(:journal).permit(:subject, :body).merge(viewers: viewers)
  end

  def set_journal
    @journal = current_user.journals.find(params[:id])
  end

  def set_supporters
    @supporters = current_user.supporters.order(:username)
  end
end
