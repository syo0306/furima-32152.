FactoryBot.define do
  factory :item do
    name               {'aaa'}
    text               {'aaa'}
    item_price         { 3000 }
    category_id        { 3 }
    status_id          { 4 }
    item_postage_id    { 2 }
    area_id            { 5 }
    day_id            { 2 }

    after(:build) do |item|
     item.image.attach(io: File.open('public/images/test_image.png'), filename: 'public/images/test_image.png')
    end
  end
end
