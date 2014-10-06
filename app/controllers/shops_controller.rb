class ShopsController < ApplicationController
  before_action :require_user

  def index
    @shops = Shop.find(params[:id]).all
  end

  def show
    @shop = Shop.find(params[:id])
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
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