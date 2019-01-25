class Career
  include Mongoid::Document
  field :name,         type: String
  field :description,  type: String
  field :requirements, type: String
  field :benefits,     type: String
  field :active,       type: Boolean
end
