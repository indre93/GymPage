class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user 
      session[:user_id] = @user.id
      flash[:notice] = "Account was successfully created. Welcome to GymPage #{@user.first_name}!"
      redirect_to @user
    else
      redirect_to new_user_path
    end
  end

  def show
    find_user
    redirect_if_not_a_user
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def find_user
    @user = User.find_by(id: params[:id])
  end
end
