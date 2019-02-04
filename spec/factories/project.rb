FactoryBot.define do
  factory :project do
    name        { Faker::Lorem.word }
    url         { Faker::Internet.url }
    description { Faker::Lorem.sentence }
    content     { Faker::Lorem.sentence }
    category_id { Category.where(name: Faker::Lorem.word).first_or_create! }
  end
end
