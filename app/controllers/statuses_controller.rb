class StatusesController < ApplicationController
  before_action :set_status, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction

  respond_to :html

  def index
    @statuses = Status.order(sort_column + " " + sort_direction)
    respond_with(@statuses)
  end

  def show
    respond_with(@status)
  end

  def new
    @status = Status.new
    respond_with(@status)
  end

  def edit
  end

  def create
    @status = current_user.statuses.build(status_params)
    binding.pry
    @status.save
    respond_with(@status)
  end

  def update
    @status.update(status_params)
    respond_with(@status)
  end

  def destroy
    @status.destroy
    respond_with(@status)
  end

  private
    def set_status
      @status = Status.find(params[:id])
    end

    def status_params
      params.require(:status).permit(:body, :image, :video)
    end

    def sort_column
      Status.column_names.include?(params[:sort]) ? params[:sort] : "body"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
