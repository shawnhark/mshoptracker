class SessionsController <ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      if user.active?
        session[:user_id] = user.id
        redirect_to home_path, notice: "You are now logged in."
      else
        flash[:error] = "Your account has been suspended. Please contact customer service."
        redirect_to sign_in_path
      end
    else
      flash[:error] = "Sorry, something is wrong with user name and/or password."
      redirect_to sign_in_path
    end
  end

end