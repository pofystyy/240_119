class UploadsController < ApplicationController
  def index
    uploads = Upload.all
    render json: UploadSerializer.new(uploads).serialized_json
  end

  def show
    upload = Upload.find(params[:id])
    render json: UploadSerializer.new(upload).serialized_json
  end
end
