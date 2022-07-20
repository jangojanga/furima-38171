FactoryBot.define do
  factory :item do

     association :user

    name { Faker::Name.last_name }
    description { Faker::Name.last_name }
    category_id { Faker::Number.between(from: 2, to: 21) }
    item_status_id{ Faker::Number.between(from: 2, to: 8) }
    lord_id{ Faker::Number.between(from: 2, to: 3) }
    former_area_id{ Faker::Number.between(from: 2, to: 47) }
    days_before_id{ Faker::Number.between(from: 2, to: 4) }
    price{ Faker::Number.between(from: 300, to: 99999) }

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/flag.png'), filename: 'flag.png')
    end
  end
end
