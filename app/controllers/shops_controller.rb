class ShopsController < ApplicationController
  before_action :require_user

  def index
    @shops = current_user.shops
  end

  def show
    @shop = Shop.find(params[:shop_id])
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    @user = current_user
    if @shop.save
      flash.now[:info] = "You have successfully added a new shop."
      redirect_to shop_path
    else
      flash.now[:danger] = "Unable to save this shop. Please try again."
      render :new
    end
  end

  private
  def shop_params
    params.require(:shop).permit!
  end
end