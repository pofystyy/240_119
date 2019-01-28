class Upload
  include Mongoid::Document
  include FileUploader::Attachment.new(:file)

  field :url, type: String
end
