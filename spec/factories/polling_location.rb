FactoryBot.define do
  factory :polling_location do
    title { Faker::Lorem.word }
    address { Faker::Address.full_address }
    city { Faker::Address.city }
    postal_code { "T2R 1C4" }

    association :riding
  end
end
