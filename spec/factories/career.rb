FactoryBot.define do
  factory :career do
    name         { Faker::Lorem.word }
    description  { Faker::Lorem.sentence }
    requirements { Faker::Lorem.sentence }
    benefits     { Faker::Lorem.sentence }
    active       { false }
  end
end
