class Attachment
  include Mongoid::Document

  field :file, type: String
  field :info, type: String
  mount_uploader :file, AttachmentUploader

  def file_link
    %{<a href="#{self.file.url}", target="_blank">Link</a>}.html_safe
  end
end
