require "rails_helper"

RSpec.describe 'Access to register page', type: :request do

  context 'unauthorized user' do
    it 'redirect to login page' do
      get rails_admin_path
      expect(response).to have_http_status(302)
    end

    it 'login page' do
      post login_path
      expect(response).to have_http_status(200)
    end

    it 'admin page' do
      DatabaseCleaner.clean
      @user = create(:user)
      login_user
      get rails_admin_path
      expect(response).to have_http_status(302)
      expect(response).to redirect_to("/login")
    end
  end

  context 'authorized user' do
    before(:each) do
      DatabaseCleaner.clean
      @user = create(:user, email: 'user@mail.com', password: '123456')
      login_user
    end

    it 'admin page' do
      get rails_admin_path
      expect(response).to have_http_status(200)
    end
  end
end
