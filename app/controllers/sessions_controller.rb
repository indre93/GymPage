class SessionsController < ApplicationController

  def welcome
  end

  def new
  end

  def create
    # Find user in our db
    @user = User.find_by(email: params[:user][:email])
    # If @user true authenticate password
    if @user.try(:authenticate, params[:user][:password])
      session[:user_id] = @user.id
      flash[:notice] = "Welcome back #{@user.first_name}!"
      redirect_to @user
    else
      flash[:error] = "Sorry! The information you have entered in invalid. Please try again."
      redirect_to login_path
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:notice] = "See ya next time!"
    redirect_to root_path
  end

end