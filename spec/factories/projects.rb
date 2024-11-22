FactoryBot.define do
  factory :project do
    title {"project"}
    description {Faker::Lorem.characters(number: rand(1..500))}
    display {0}
    association :owner
  end
end
