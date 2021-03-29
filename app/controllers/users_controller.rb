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

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
