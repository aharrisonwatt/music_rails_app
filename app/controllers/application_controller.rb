class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :logged_in?

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def log_out!
    @current_user.reset_session_token
    session[:session_token] = nil
    @current_user = nil
  end

  def log_in!(user)
    session[:session_token] = user.reset_session_token
  end

  def require_user!
    unless logged_in?
      redirect_to bands_url
      flash[:error] = "you need to log in to do that"
    end
  end

  def logged_in?
    !current_user.nil?
  end


end
