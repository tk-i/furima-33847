FactoryBot.define do
  factory :item do
    association :user
    title       { Faker::Lorem.word }
    text        { Faker::Lorem.sentence }
    category_id { Faker::Number.within(range: 2..11) }
    status_id   { Faker::Number.within(range: 2..7) }
    burden_id   { Faker::Number.within(range: 2..3) }
    area_id     { Faker::Number.within(range: 2..48) }
    shipment_id { Faker::Number.within(range: 2..4) }
    price       { Faker::Number.within(range: 300..9999999) }
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
