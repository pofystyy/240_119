class CareerSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :description, :requirements, :benefits, :active
end
