class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create

  end

  def show

  end

  def edit
  end

  def update
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :height, :weight, :password)
  end

end
