class ApplicationController < ActionController::Base
   before_action :require_login
   
   helper_method :current_user, :logged_in?, :current_users_workout?

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

   def redirect_if_current_user
      if current_user
         redirect_to workouts_path
      end
   end

   def current_users_workout?
      current_user == @workout.user
   end

end
