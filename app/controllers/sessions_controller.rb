class SessionsController <ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      if user.active?
        session[:user_id] = user.id
        flash[:success] = "You are now logged in."
        redirect_to shop_path
      else
        flash[:danger] = "Your account is not active at this time. Please contact customer service."
        redirect_to sign_in_path
      end
    else
      flash[:warning] = "Sorry, something is wrong with user name and/or password."
      redirect_to sign_in_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:info] = "You are now logged out."
    redirect_to root_path
  end

  private
  def sessions_params
    params.require(:session).permit!
  end

end