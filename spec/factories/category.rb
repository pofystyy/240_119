FactoryBot.define do
  factory :category do
    name { Faker::Lorem.word }

    factory :category_with_project do
      after(:create) do |category|
        create(:project, category: category)
      end
    end
  end
end
