class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to root_path
    elsif @user
      @errors = ["Invalid Password"]
      render :new
    else
      @errors = ["Invalid Username"]
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  def create_with_github
    user_info = request.env["omniauth.auth"]
    current_user.update_column(:access_token, user_info[:credentials][:token])
    redirect_to root_path
  end
end
