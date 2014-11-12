class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    if @user.save
      log_in @user
      flash[:info] = "You have registered successfully, and you are now logged in."
      redirect_to user_home_path
    else
      flash.now[:danger] = "Unable to register you account. Please try again."
      render :new
    end
  end

  def show
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(users_params)
      flash[:info] = "Your user information was successfully updated."
      redirect_to user_home_path
    else
      flash.now[:danger] = "Unable to register you account. Please try again."
      flash.now[:danger] = @user.errors
      render :edit
    end
  end

  def user_home
    set_user_shops
    @payments = @user.payments
  end

private
  def users_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :token, :admin, :active)
  end

  def set_user_shops
    @user = current_user
    @shops = @user.shops
  end
end
