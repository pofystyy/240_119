class EducationsController < ApplicationController
  def index
    @educations = Education.all
    render json: @careers
  end

  def show
    @education = Education.find(params[:id])
    render json: @career
  end
end
