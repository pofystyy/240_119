class CareersController < ApplicationController
  def index
    careers = Career.all
    render json: CareerSerializer.new(careers).serialized_json
  end

  def show
    career = Career.find(params[:id])
    render json: CareerSerializer.new(career).serialized_json
  end
end
