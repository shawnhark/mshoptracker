require 'rails_helper'

describe UsersController do
  describe "GET new" do
    it "sets the @user to a new user" do
      get :new
      expect(assigns(:user)).to be_instance_of(User)
    end
  end

  describe "POST create" do
    context "successful user signup" do

      it "redirects to the login page" do
        post :create, user: Fabricate.attributes_for(:user)
        expect(response).to redirect_to(about_path)
      end

      it "sets flash success notice" do
        post :create, user: Fabricate.attributes_for(:user)
        expect(flash.now[:info]).to eq("You have registered successfully, and you are now logged in.")
      end
    end

    context "failed user sign up" do
      it "renders the new template" do
        post :create, user: Fabricate.attributes_for(:user, email:"")
        expect(response).to render_template :new
      end

      it "sets the flash error message" do
        post :create, user: Fabricate.attributes_for(:user, email:"")
        expect(flash.now[:danger]).to eq("Unable to register you account. Please try again.")
      end
    end
  end
end