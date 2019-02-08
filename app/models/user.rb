class User
  include Mongoid::Document
  authenticates_with_sorcery!

  field :admin, type: Mongoid::Boolean, :default => false
end
