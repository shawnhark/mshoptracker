class ShopsController < ApplicationController
  before_action :set_shop, only: [:show, :edit, :update, :destroy]
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
      flash.now[:info] = "You have successfully added a new shop."
      redirect_to shop_path(@shop)
    else
      flash.now[:danger] = "Unable to save this shop. Please try again."
      render :new
    end
  end

  def update
    set_shop
    respond_to do |format|
      if @shop.update(shop_params)
        format.html { redirect_to @shop, notice: 'Payment was successfully updated.' }
        format.json { render :show, status: :ok, location: @shop }
      else
        format.html { render :edit }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
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