class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path
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
    user = User.find_or_create_by(username: request.env["omniauth.auth"]["info"]["nickname"]) do |u|
      u.password = "password"
    end
    if user.save
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      redirect_to signup_path
    end
  end
end
