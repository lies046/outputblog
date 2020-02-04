FactoryBot.define do

  factory :post do
    title      {"aaaaaaa"}
    content    {"aaaaaaaaaaaaaaa"}
    image      {"test.png"}
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    user
  end
end