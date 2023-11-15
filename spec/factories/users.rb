FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "User #{n}" }
    email { Faker::Internet.email }
    city { "Dottietown" }
    state { "Delaware" }
    country_code { "US" }
    interests { ["golf", "urban", "mountains"] }
  end
end
