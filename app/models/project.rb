class Project
  include Mongoid::Document
  field :name,        type: String
  field :url,         type: String
  field :description, type: Text
  field :content,     type: Text

  belongs_to: category
end
