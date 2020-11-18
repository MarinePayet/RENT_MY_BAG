require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "destroying user"

Booking.destroy_all
Bag.destroy_all
User.destroy_all
puts "destroying bag"

puts "start user"
10.times do
  @user_new = User.create!(
    email: Faker::Internet.email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address: Faker::Address.city,
    password: Faker::Code.npi
    )
end
puts "user finish"
puts "start bags"

User.create!(email: "marine@gmail.com", first_name: "Marine", last_name: "Payet", address: "16 Villa Gaudelet, Paris", password: "123456")

20.times do
  @bag_new = Bag.create!(
    title: Faker::Marketing.buzzwords,
    brand: Bag::BRAND.sample,
    price: [30, 40, 50, 60].sample,
    style: ["handbag", "clutch", "tote", "doctor"].sample,
    mood: ["Cocktail", "Wedding", "Daytime"].sample,
    color: Faker::Color.color_name,
    availability: [true, false].sample,
    user_id: @user_new.id
    )
  file = URI.open("https://source.unsplash.com/collection/8360089/300x300")
  @bag_new.photo.attach(io: file, filename: "some-image.jpg", content_type: 'image/jpg')
  @bag_new.save
end
puts "end bags"
puts "start booking"

10.times do
  Booking.create!(
    start_date: Faker::Date.forward(days: 365),
    end_date: Faker::Date.forward(days: 365),
    user_id: @user_new.id,
    bag_id: @bag_new.id
    )
end

puts "booking finish"
