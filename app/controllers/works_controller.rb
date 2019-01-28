class WorksController < ApplicationController
  def index
    @works = Work.all
    render json: @careers
  end

  def show
    @work = Works.find(params[:id])
    render json: @career
  end
end
