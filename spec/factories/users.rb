FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    first_name            {Faker::Internet.first_name}
    first_name_kana       {Faker::Internet.first_name_kana}
    last_name             {Faker::Internet.last_name}
    last_name_kana        {Faker::Internet.last_name_kana}
    birth_day             {Faker::Internet.birth_bay}
  end
end