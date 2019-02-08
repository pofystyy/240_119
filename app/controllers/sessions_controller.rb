class SessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]
  def create
    if login(params[:email], params[:password])
      redirect_to rails_admin_path
    else
      render 'new'
    end
  end

  def destroy
    logout
    redirect_to login_path
  end
end
