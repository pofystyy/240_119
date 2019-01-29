class UploadsController < ApplicationController
  def index
    @uploads = Upload.all
    render json: @careers
  end

  def show
    @upload = Upload.find(params[:id])
    render json: @upload
  end
end
