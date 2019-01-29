class ProjectsController < ApplicationController
  def index
    if params[:category].blank?
      projects = Project.all
    else
      category_id = Category.find(name: params[:category]).id
      projects = Project.where(category_id: category_id)
    end
    render json: ProjectSerializer.new(projects).serialized_json
  end

  def show
    project = Project.find(params[:id])
    render json: ProjectSerializer.new(project).serialized_json
  end
end
