FactoryBot.define do
  factory :user do
    nickname {"test1"}
    profile {Faker::Lorem.characters(number: rand(1..500))}
    email {"test1@test.com"}
    password {"111111"}
    password_confirmation {password}
  end
end
