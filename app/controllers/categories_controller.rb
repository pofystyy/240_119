class CategoriesController < ApplicationController
  skip_before_action :require_login, only: [:index, :show]
  def index
    categories = Category.all
    render json:CategorySerializer.new(categories, include: [:projects]).serialized_json
  end

  def show
    category = Category.find(params[:id])
    render json: CategorySerializer.new(category, include: [:projects]).serialized_json
  end
end
