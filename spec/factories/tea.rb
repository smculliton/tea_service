FactoryBot.define do
  factory :tea do
    title { Faker::Tea.variety }
    description { Faker::Fantasy::Tolkien.poem }
    temperature { Faker::Number.within(range: 160..205) }
    brew_time { "#{[1,2,3].sample}-#{[4,5,6].sample} mins" }
    unit_price { [20,25,30,35,40,45,50].sample }
  end
end