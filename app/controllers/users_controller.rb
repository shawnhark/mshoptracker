class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    token = SecureRandom.urlsafe_base64
    if @user.save
      flash.now[:info] = "You have now registered successfully. Please log in."
      redirect_to login_path
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
