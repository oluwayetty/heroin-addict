class AdminController < ApplicationController
  before_action :verify_admin

  def index
  end

  private
  def verify_admin
    unless current_user.admin?
      redirect_to root_path
      flash[:alert] = "Unauthorized to view the page"
    end
  end

end
