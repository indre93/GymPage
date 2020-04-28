class SessionsController < ApplicationController
   before_action :redirect_if_current_user, only: [:welcome, :new]

   def welcome
   end

   def new
   end

   def create
      @user = User.find_by(email: params[:user][:email])
      # If @user true authenticate password
      if @user.try(:authenticate, params[:user][:password])
         session[:user_id] = @user.id
         flash[:message] = "Welcome back #{@user.username}!"
         redirect_to @user
      else
         flash[:error] = "Sorry! The information you have entered in invalid. Please try again or sign up."
         redirect_to login_path
      end
   end 

   def destroy
      session.delete(:user_id)
      flash[:message] = "You have successfully logged out."
      redirect_to login_path
   end

end