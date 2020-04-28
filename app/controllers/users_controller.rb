class UsersController < ApplicationController
   before_action :require_login, only: [:show]
   
   def new
      @user = User.new
   end

   def create
      @user = User.new(user_params)
      if @user.save
         session[:user_id] = @user.id
         flash[:message] = "Successfully created account. Welcome to GymPage #{@user.username}!"
         redirect_to @user
      else
         render :new
      end
   end

   def show
      @user = User.find_by(id: params[:id])
   end

   private

   def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
   end

end
