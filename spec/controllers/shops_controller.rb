require 'rails_helper'

describe ShopsController do 
  describe "GET new" do
    it "sets the @shop to a new user" do
      get :new
      expect(assigns(:shop)).to be_instance_of(Shop)
    end

  describe "POST create" do
    context "shop created successfully" do
      it "redirects to the login page" do
        post :create, shop: Fabricate.attributes_for(:shop)
        expect(response).to redirect_to(shop_path)
      end

      it "sets flash success notice" do
        post :create, shop: Fabricate.attributes_for(:shop)
        expect(flash.now[:info]).to eq("You have successfully added a new shop.")
      end
    end

    context "failed shop" do
      it "renders the new template" do
        post :create, shop: Fabricate.attributes_for(:shop, store_name:"")
        expect(response).to render_template :new
      end

      it "sets the flash error message" do
        post :create, user: Fabricate.attributes_for(:user, email:"")
        expect(flash.now[:danger]).to eq("Unable to save this shop. Please try again.")
      end
    end
  end 

end