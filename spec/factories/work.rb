FactoryBot.define do
  factory :work do
    year        { Faker::Number.number(4) }
    description { Faker::Lorem.sentence }
  end
end
