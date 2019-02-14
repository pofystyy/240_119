class Work
  include Mongoid::Document
  field :year,         type: Integer
  field :description,  type: String

  validates_presence_of :year, :description
end
