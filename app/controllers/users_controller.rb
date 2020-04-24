class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user
      session[:user_id] = @user.id
      flash[:message] = "Account was successfully created. Welcome to GymPage #{@user.username}!"
      redirect_to @user
    else
      flash[:error] = "Sorry! The information you have entered is invalid. Please try again."
      render :new
    end
  end

  def show
    find_user
    redirect_if_not_a_user
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  def find_user
    @user = User.find_by(id: params[:id])
  end
end
