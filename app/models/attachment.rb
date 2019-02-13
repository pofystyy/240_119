require 'uri'
class Attachment
  include Mongoid::Document

  field :file, type: String
  field :info, :carrierwave
  mount_uploader :file, AttachmentUploader

  def info 
  	url = self.file.url
	  %{<a href="#{url}">#{url}</a>}.html_safe
	end	

end
