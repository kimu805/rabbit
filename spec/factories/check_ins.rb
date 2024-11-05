FactoryBot.define do
  factory :check_in do
    date {Date.today}
    status {true}
    association :habit
  end
end
