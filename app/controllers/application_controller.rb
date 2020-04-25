class ApplicationController < ActionController::Base
  # Makes methods available in views as well
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_login
    if !logged_in?
      flash[:error]= "Sorry! You must be logged in to view this page. Please log in or sign up."
      redirect_to root_path
    end
  end

end
