require 'rails_helper'

RSpec.describe PropertyController, type: :controller do
  describe "GET #index" do
    it "returns a successful response" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns @properties with a list of properties" do
      properties = create_list(:property, 3)
      get :index
      expect(assigns(:properties)).to eq(properties)
    end
  end

  describe "GET #show" do
    let(:property) { create(:property) }

    it "returns a successful response" do
      get :show, params: { id: property.id }
      expect(response).to have_http_status(:success)
    end

    it "assigns the requested property to @property" do
      get :show, params: { id: property.id }
      expect(assigns(:property)).to eq(property)
    end
  end
end
