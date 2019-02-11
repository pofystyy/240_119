require 'rails_helper'

RSpec.describe UserSessionsController, type: :controller do
  describe "GET index" do
    it "has a 200 status code" do
      get :create
      expect(response.status).to eq(200)
    end

    it "has a 200 status code" do
      get :create, params: { email: 'w@w.com', password: '123' }
      expect(response.status).to eq(200)
    end
  end
end
