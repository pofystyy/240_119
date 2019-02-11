class AttachmentsController < ApplicationController
    skip_before_action :require_login, only: [:index, :show]
  def index
    attachments = Attachment.all
    render json: AttachmentSerializer.new(attachments).serialized_json
  end

  def show
    attachment = Attachment.find(params[:id])
    render json: AttachmentSerializer.new(attachment).serialized_json
  end
end
