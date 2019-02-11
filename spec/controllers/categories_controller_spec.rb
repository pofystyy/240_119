require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  describe "GET index" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end

    it "responds with JSON" do
      get :index
      expect(response.header['Content-Type']).to include('application/json')
    end
  end
end
