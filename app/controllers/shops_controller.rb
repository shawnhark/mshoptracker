class ShopsController < ApplicationController
  before_action :set_shop, only: [:show, :edit, :destroy]
  before_action :require_user
  before_action :set_user_shops, only: [:index, :show]

  def index
#    @current_shops = Shop.where("user_id = ? AND shop_date = ?", current_user.id, Time.now.year)
    #syntax

#    @current_shops = Shop.where("user_id = ? AND shop_date = ?", current_user.id, Time.now.year )
    #WHERE (user_id = 9 AND shop_date = 2014)

#    @current_shops = Shop.current.where("user_id = ?", current_user.id )
    #WHERE (shop_date = 2014 ) AND (user_id = 9)

#    @current_shops = User.joins(:shops).where("shop_date = ?", Time.now.year)
    #INNER JOIN "shops" ON "shops"."user_id" = "users"."id" WHERE (shop_date = 2014)

#    @current_shops = @shops.current_year(params[this_year])
    #WHERE "shops"."user_id" = ? AND (strftime('%Y', shop_date) = 2014)  [["user_id", 9]]

    @current_shops = @shops.current
    #WHERE "shops"."user_id" = ? AND (shop_date = 2014 )  [["user_id", 9]]

#    @current_shops = Shop.where("user_id = ?", current_user.id).where("shop_date = ?", Time.now.year)

#    @expense_total = Shop.reduce(0) do |sum, value|
#      sum + value
#    end
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
    params.require(:shop).permit(:store_name, :location, :shop_date, :shop_time, :expenses, :reimbursement, :fee, :ms_company, :user_id)
  end

  def set_shop
    @shop = Shop.find(params[:id])
  end

  def set_user_shops
    @user = current_user
    @shops = @user.shops
  end

  def this_year
    Time.now.year
  end

#  def current_year
#    @shops = Shop.where('extract(year from shop_date = ?', Time.now.year)
#  end

end