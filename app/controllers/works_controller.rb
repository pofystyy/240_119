class WorksController < ApplicationController
  def index
    works = Work.all
    render json: WorkSerializer.new(works).serialized_json
  end

  def show
    work = Works.find(params[:id])
    render json: WorkSerializer.new(work).serialized_json
  end
end
