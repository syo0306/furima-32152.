FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    first_name            {Faker::Internet.username}
    first_name_kana       {Faker::Internet.username}
    last_name             {Faker::Internet.username}
    last_name_kana        {Faker::Internet.username}
    birth_day             {Faker::Date.between_except(from: 1.year.ago, to: 1.year.from_now, excepted: Date.today)}
  end
end