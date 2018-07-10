class UsersController < AdminController
  before_action :set_user!, only: :update

  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors
    end
  end

  private

  def user_params
    params.require(:user).permit(:admin)
  end

  def set_user!
    @user = User.find_by(id: params[:id])
    head :not_found unless @user
  end
end
