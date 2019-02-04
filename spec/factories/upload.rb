FactoryBot.define do
  factory :upload do
    url_data { Faker::Internet.url }
  end
end
