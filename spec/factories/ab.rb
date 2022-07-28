FactoryBot.define do
  factory :ab do
    post_code { '000-0000' }
    former_area_id { Faker::Number.between(from: 2, to: 47) }
    city { Faker::Name.last_name }
    address { Faker::Name.last_name }
    building { Faker::Name.last_name }
    tel { '00000000000' }

    token { 'tok_abcdefghijk00000000000000000' }
  end
end
