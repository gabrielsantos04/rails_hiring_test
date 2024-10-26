FactoryBot.define do
  factory :riding do
    name { Faker::Address.city }
    province { Faker::Address.state_abbr }
    riding_code { Faker::Number.number(digits: 5).to_s }
  end
end
