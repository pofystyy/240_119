class EducationSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :launch_date, :description, :requirements, :results, :active
end
