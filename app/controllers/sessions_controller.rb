class SessionsController <ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in user
      flash[:info] = "You are now logged in."
      redirect_to register_path
    else
      flash[:danger] = "Sorry, something is wrong with user name and/or password."
      render 'new'
    end
  end

  def destroy
    log_out
    flash[:info] = "You are now logged out."
    redirect_to root_path
  end

  private
  def sessions_params
    params.require(:session).permit!
  end

end