# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).


10.times do 
  Customer.create!(
    first_name: Faker::Name.first_name, 
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    address: Faker::Address.full_address
  )
end

10.times do 
  Tea.create!(
    title: Faker::Tea.variety,
    description: Faker::Fantasy::Tolkien.poem,
    temperature: Faker::Number.within(range: 160..205),
    brew_time: "#{[1,2,3].sample}-#{[4,5,6].sample} mins",
    unit_price: [20,25,30,35,40,45,50].sample
  )
end