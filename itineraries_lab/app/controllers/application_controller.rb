class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def confirm_logged_in
    unless session[:user_id]
      redirect_to login_path, alert: "Please log in!"
    end
  end
  
  private
  def current_user
    @current_user ||= User.find session[:user_id] if session[:user_id]
  end
  helper_method :current_user

end
