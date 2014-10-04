class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    if @user.save
      log_in @user
      flash[:info] = "You have registered successfully, and you are now logged in."
      redirect_to about_path
    else
      flash.now[:danger] = "Unable to register you account. Please try again."
      render :new
    end
  end

  def show
  end

private
  def users_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :token, :admin, :active)
  end

end
