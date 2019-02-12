FactoryBot.define do
  factory :attachment do
    file { File.open(ENV["FILE_PATH"]) }
  end
end