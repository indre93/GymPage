class SessionsController < ApplicationController

  def welcome
    @workouts = Workout.all.includes(:user)
  end

  def new
  end

  def create
    # Find user in our db
    @user = User.find_by(email: params[:user][:email])
    # If @user true authenticate password
    if @user.try(:authenticate, params[:user][:password])
      session[:user_id] = @user.id
      flash[:message] = "Welcome back #{@user.username}!"
      redirect_to @user
    else
      flash[:error] = "Sorry! The information you have entered in invalid. Please try again."
      redirect_to login_path
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:message] = "See ya next time!"
    redirect_to login_path
  end

end