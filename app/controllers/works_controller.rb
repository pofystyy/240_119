class WorksController < ApplicationController
  skip_before_action :require_login, only: [:index, :show]
  def index
    works = Work.all
    render json: WorkSerializer.new(works).serialized_json
  end

  def show
    work = Work.find(params[:id])
    render json: WorkSerializer.new(work).serialized_json
  end
end
