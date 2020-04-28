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
         flash[:message] = "Hi, #{@user.username}!"
         redirect_to @user
      else
         flash[:error] = "Sorry! The information you have entered in invalid. Please try again or sign up."
         redirect_to login_path
      end
   end 
   
   def google
      @user = User.find_or_create_by(email: auth["info"]["email"]) do |user|
         user.username = auth["info"]["name"]
         user.password = SecureRandom.hex(10)
      end
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