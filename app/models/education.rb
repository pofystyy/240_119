class Education
  include Mongoid::Document
  field :name,         type: String
  field :launch_date,  type: String
  field :description,  type: String
  field :requirements, type: String
  field :results,      type: String
  field :active,       type: Mongoid::Boolean, :default => true

  validates_presence_of :name, :launch_date, :description, :requirements, :results
end
