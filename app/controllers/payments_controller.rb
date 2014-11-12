class PaymentsController < ApplicationController
  before_action :set_payment, only: [:show, :edit, :update, :destroy]
  before_action :set_user
  before_action :require_user

  def index
    @payments = @user.payments
  end

  def show
  end

  def new
    @payment = Payment.new
  end

  def edit
  end

  def create
    @payment = Payment.new(payment_params)
    @payment.user_id = current_user.id
    if @payment.save
      flash[:info] =  'Payment was successfully created.'
      redirect_to payments_path
    else
      render :edit
    end
  end

  def update
    if @payment.update(payment_params)
      flash[:info] = 'Payment was successfully updated.'
      redirect_to payments_path
    else
      render :edit
    end
  end

  def destroy
    @payment.destroy
    respond_to do |format|
      format.html { redirect_to payments_url, notice: 'Payment was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    def set_payment
      @payment = Payment.find(params[:id])
    end

    def set_user
      @user = current_user
    end

    def payment_params
      params.require(:payment).permit(:ms_company, :payments, :pay_period_start, :pay_period_end, :user_id)
    end
end
