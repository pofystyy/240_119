class Work
  include Mongoid::Document
  field :year,         type: Integer
  field :description,  type: String
end
