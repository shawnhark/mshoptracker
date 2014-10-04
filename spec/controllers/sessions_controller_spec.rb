require 'rails_helper'

describe SessionsController do
  describe "GET new" do    
    it "renders the new template" do
      get :new
      expect(response).to render_template :new
    end

    it "redirects to the home path when the input is valid" do
      session[:session][:user_id] = Fabricate(:user).id
      get :new
      expect(response).to redirect_to register_path
    end
  end
end