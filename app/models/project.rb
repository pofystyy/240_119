class Project
  include Mongoid::Document
  field :name,        type: String
  field :url,         type: String
  field :description, type: String
  field :content,     type: String

  belongs_to :category
end
