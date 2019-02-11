class Attachment
  include Mongoid::Document

  field :file,         type: String
  mount_uploader :file, AttachmentUploader
end
