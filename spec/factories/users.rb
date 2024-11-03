FactoryBot.define do
  factory :user do
    nickname: "test1"
    email: "test1@test.com"
    password: "111111"
    password_confirmation: password
  end
end
