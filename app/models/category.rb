class Category
  include Mongoid::Document
  field :name, type: String

  has_many :projects
end
