FactoryBot.define do
  factory :education do
    name         { Faker::Lorem.word }
    launch_date  { Faker::Lorem.sentence }
    description  { Faker::Lorem.sentence }
    requirements { Faker::Lorem.sentence }
    results      { Faker::Lorem.sentence }
    active       { false }
  end
end
