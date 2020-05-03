class UsersController < ApplicationController
   skip_before_action :require_login, only: [:new, :create]
   before_action :redirect_if_current_user, only: [:new, :create]
   
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
      if @user
         @workouts = @user.workouts.by_completion_date.includes(:exercises)
      else
         flash[:error] = "Sorry! this user does not exist."
         redirect_to workouts_path
      end
   end

   private

   def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
   end

end
