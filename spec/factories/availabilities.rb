FactoryBot.define do
  factory :availability do
    starts_on { Date.today }
    ends_on { Date.tomorrow }
    property
  end
end
