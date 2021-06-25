FactoryBot.define do
  factory :log_buyer do
    postal { '123-4567' }
    area_id { Faker::Number.within(range: 2..48) }
    city { Gimei.city.kanji }
    address { '1-1' }
    address2 { 'マンション' }
    phone { '09012345678' }
    token { 'tok_1665475702' }
  end
end