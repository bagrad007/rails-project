class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :logged_in?
  helper_method :require_login

  def current_user
    @user = User.find_by(id: session[:user_id])
  end

  def require_login
    redirect_to "/login" if !current_user
  end
end
