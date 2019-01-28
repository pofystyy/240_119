class CareersController < ApplicationController
  def index
    @careers = Career.all
    render json: @careers
  end

  def show
    @career = Career.find(params[:id])
    render json: @career
  end
end
