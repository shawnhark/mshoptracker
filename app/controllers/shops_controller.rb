class ShopsController < ApplicationController
  before_action :require_user

  def index
    @user = current_user
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
    @shop.user_id = current_user.id
    if @shop.save
      flash.now[:info] = "You have successfully added a new shop."
      redirect_to shop_path(@shop)
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