class ProjectSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :url, :description, :content
  belongs_to :category
end
