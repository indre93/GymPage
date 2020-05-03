class SessionsController < ApplicationController
   skip_before_action :require_login
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
         flash[:message] = "Hi, #{@user.username}!"
         redirect_to @user
      else
         flash[:error] = "Sorry! The information you have entered is invalid. Please try again or sign up."
         redirect_to login_path
      end
   end 
   
   def google
      @user = User.from_omniauth(auth)
      if @user.save
         session[:user_id] = @user.id
         flash[:message] = "Hi, #{@user.username}!"
         redirect_to @user
      else
         redirect_to root_path
      end
   end
   
   def destroy
      session.delete(:user_id)
      flash[:message] = "See ya next time!"
      redirect_to root_path
   end

   private

   def auth
      request.env['omniauth.auth']
   end
   
end