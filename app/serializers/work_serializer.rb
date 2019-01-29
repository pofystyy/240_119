class WorkSerializer
  include FastJsonapi::ObjectSerializer
  attributes :year, :description
end
