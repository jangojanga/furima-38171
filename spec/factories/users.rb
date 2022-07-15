FactoryBot.define do
  factory :user do
    name { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password { Faker::Internet.password(min_length: 6) + '1a' }
    password_confirmation { password }
    family_name { Gimei.name.first.kanji }
    family_name_huri { Gimei.name.first.katakana }
    first_name { Gimei.name.first.kanji }
    first_name_huri { Gimei.name.first.katakana }
    birthday { Faker::Date.between(from: '1930-01-01', to: '2022-12-31') }
  end
end
