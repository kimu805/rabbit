FactoryBot.define do
  factory :user do
    nickname {"user"}
    profile {Faker::Lorem.characters(number: rand(1..500))}
    email {"user@user.com"}
    password {"111111"}
    password_confirmation {password}
  end
end
