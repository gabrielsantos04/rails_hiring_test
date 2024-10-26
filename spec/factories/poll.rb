FactoryBot.define do
  factory :poll do
    number { Faker::Number.number(digits: 4).to_s }

    association :riding
    association :polling_location
  end
end
