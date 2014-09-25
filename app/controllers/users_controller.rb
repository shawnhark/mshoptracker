class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)
  end

private
  def users_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :token, :admin, :active)
  end
end
