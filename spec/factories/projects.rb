FactoryBot.define do
  factory :project do
    title {"project"}
    description {Faker::Lorem.characters(number: rand(1..500))}
    display {Faker::Lorem.characters(number: rand(0..1))}
    association :user
  end
end
