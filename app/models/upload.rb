class Upload
  include Mongoid::Document
  include UrlUploader::Attachment.new(:url)

  field :url_data, type: String
end
