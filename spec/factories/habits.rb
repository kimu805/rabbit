FactoryBot.define do
  factory :habit do
    name {"habit"}
    content {Faker::Lorem.characters(number: rand(1..500))}
    frequency {Faker::Number.between(from: 1, to: 7)}
    association :project
  end
end
