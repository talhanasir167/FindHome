require 'rails_helper'

RSpec.describe UserController, type: :controller do
  describe "GET #index" do
    it "returns a successful response" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns @users with a list of users" do
      users = create_list(:user, 3)
      get :index
      expect(assigns(:users)).to eq(users)
    end
  end

  describe "GET #show" do
    let(:user)      { create(:user) }
    let(:property)  { create(:property) }
    let(:property2) { create(:property, lat: 121.211, lng: -12.89,) }
    let(:score)     { create(:user_property_score, property: property, user: user) }


    before do
      allow(controller).to receive(:user_coordinates_from_geocoder).and_return([37.7749, -122.4194])
      allow(controller).to receive(:find_nearby_properties).and_return([property])
      allow(controller).to receive(:get_interest_base_properties).and_return([property])
    end

    it "returns a successful response" do
      get :show, params: { id: user.id }
      expect(response).to have_http_status(:success)
    end

    it "assigns interest-based properties to @properties" do
      properties = create_list(:property, 3)
      allow(controller).to receive(:get_interest_base_properties).and_return(properties)
      
      get :show, params: { id: user.id }
      expect(assigns(:properties)).to eq(properties)
    end

    it "assigns the requested user to @user" do
      get :show, params: { id: user.id }
      expect(assigns(:user)).to eq(user)
    end

    it "assigns nearby properties to @nearby_properties" do      
      get :show, params: { id: user.id }
      expect(assigns(:nearby_properties)).to eq([property])
    end

    it "renders the show template" do
      get :show, params: { id: user.id }
      expect(response).to render_template(:show)
    end
  end
end
