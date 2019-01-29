class EducationsController < ApplicationController
  def index
    educations = Education.all
    render json: EducationSerializer.new(educations).serialized_json
  end

  def show
    education = Education.find(params[:id])
    render json: EducationSerializer.new(education).serialized_json
  end
end
