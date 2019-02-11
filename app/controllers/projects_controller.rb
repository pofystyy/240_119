class ProjectsController < ApplicationController
  skip_before_action :require_login, only: [:index, :show]
  def index
    if params[:category].blank?
      projects = Project.all
    else
      category_id = Category.find(id: params[:category])
      projects = Project.where(category_id: category_id)
    end
    render json: ProjectSerializer.new(projects).serialized_json
  end

  def show
    project = Project.find(params[:id])
    render json: ProjectSerializer.new(project).serialized_json
  end
end
