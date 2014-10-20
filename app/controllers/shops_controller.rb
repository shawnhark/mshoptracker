class ShopsController < ApplicationController
  before_action :set_shop, only: [:show, :edit, :destroy]
  before_action :require_user
  before_action :set_user_shops, only: [:index, :show]

  def index
  end

  def show
  end

  def new
    @shop = Shop.new
  end

  def edit
    set_shop
  end

  def create
    @shop = Shop.new(shop_params)
    @shop.user_id = current_user.id
    if @shop.save
      flash[:info] = "You have successfully added a new shop."
      redirect_to shops_path
    else
      render :new
    end
  end

  def update
    @user = current_user
    @shop = Shop.find(params[:id])
    if @shop.update(shop_params)
      flash[:info] = 'Payment was successfully updated.' 
      redirect_to shops_path
    else
      render :edit
    end
  end


  private
  def shop_params
    params.require(:shop).permit!
  end

  def set_shop
    @shop = Shop.find(params[:id])
  end

  def set_user_shops
    @user = current_user
    @shops = @user.shops
  end
end