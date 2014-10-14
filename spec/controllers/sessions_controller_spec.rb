require 'rails_helper'

describe SessionsController do
  describe "GET new" do    
    it "renders the new template" do
      get :new
      expect(response).to render_template :new
    end
  end

#  describe "POST create" do
#    context "with valid credentials" do
#      before do
#        user = Fabricate.attributes_for(:user)
#        post :create, session: { email: user.email, password: user.password }
#      end
#      it "creates a session when the input is valid" do
#        expect(session[:user_id]).to eq(@user.id)
#      end
#      it "redirects to the home path when the input is valid" do
#        user = Fabricate.attributes_for(:user)
#        post :create, session: {}
#        expect(response).to redirect_to(user_home_path)
#      end
#      it "sets the notice" do
#        expect(flash[:info]).to eq("You are now logged in.")
#      end
#    end
#  end

end