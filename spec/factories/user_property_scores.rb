FactoryBot.define do
  factory :user_property_score do
    score { 4.5 }
    user
    property
  end
end
