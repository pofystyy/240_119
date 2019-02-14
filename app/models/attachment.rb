class Attachment
  include Mongoid::Document

  field :file, type: String
  field :info, type: String
  mount_uploader :file, AttachmentUploader
  before_save :generate_info

  def file_path
    self.file.url
  end
  
  def file_link
    %{<a href="#{file_path}", target="_blank">"#{file_path}"</a>}.html_safe
  end 

  def generate_info
    self.info = file_path
  end
end
