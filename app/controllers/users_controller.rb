class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if user = User.create(user_params)
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      render "new"
    end
  end

  def show
    set_user
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end

  def set_user
    @user = User.find_by(id: params[:id])
  end
end
