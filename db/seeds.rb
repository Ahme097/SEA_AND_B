# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Booking.all.destroy_all
Yacht.all.destroy_all
User.all.destroy_all

puts "destroyed seeds"
puts "creating users"

user_1 = User.create!(
  email: "owner@gmail.com",
  password: "owner111"
)

user_2 = User.create!(
  email: "buyer@gmail.com",
  password: "buyer111"
)

puts "creating yachts"

yacht_1 = Yacht.create!(
  user_id: user_1.id,
  name: "Luxury Yacht 1",
  max_guest: 10,
  cabin: 5,
  yacht_image: "yacht1.jpg",
  price_per_day: 1000,
  description: "Experience luxury on the open waters with our spacious and elegant yacht."
)

yacht_2 = Yacht.create!(
  user_id: user_1.id,
  name: "Elegant Cruiser",
  max_guest: 8,
  cabin: 4,
  yacht_image: "yacht2.jpg",
  price_per_day: 850,
  description: "Set sail in style on our elegant cruiser with stunning ocean views."
)


yacht_3 = Yacht.create!(
  user_id: user_1.id,
  name: "Ocean Paradise",
  max_guest: 12,
  cabin: 6,
  yacht_image: "yacht3.jpg",
  price_per_day: 1200,
  description: "Embark on a luxurious journey aboard our exquisite Ocean Paradise yacht."
)

yacht_4 = Yacht.create!(
  user_id: user_1.id,
  name: "Sunset Serenity",
  max_guest: 6,
  cabin: 3,
  yacht_image: "yacht4.jpg",
  price_per_day: 750,
  description: "Experience tranquility and stunning sunsets on our Sunset Serenity yacht."
)

yacht_5 = Yacht.create!(
  user_id: user_1.id,
  name: "Royal Voyager",
  max_guest: 15,
  cabin: 7,
  yacht_image: "yacht5.jpg",
  price_per_day: 1500,
  description: "Sail like royalty aboard our spacious and opulent Royal Voyager yacht."
)

yacht_6 = Yacht.create!(
  user_id: user_1.id,
  name: "Royal Mermaid",
  max_guest: 15,
  cabin: 7,
  yacht_image: "yacht6.jpg",
  price_per_day: 500,
  description: "Sail like royalty aboard our spacious and opulent Royal Mermaid."
)


puts "creating bookings"

booking_1 = Booking.create!(
  user_id: user_1.id, 
  yacht_id: yacht_1.id,
  start_date: Date.new,
  end_date: Date.new + 3.days,
)

booking_2 = Booking.create!(
  user_id: user_2.id, 
  yacht_id: yacht_4.id,
  start_date: Date.new,
  end_date: Date.new + 7.days,
)


# Yacht.create!(
#   name: "Family Yacht Getaway",
#   max_guest: 8,
#   cabin: 4,
#   yacht_image: "yacht1.jpg",
#   price_per_day: 800,
#   description: "Enjoy a perfect family vacation aboard our comfortable and well-equipped family yacht."
# )

# Yacht.create!(
#   name: "Party Yacht Extravaganza",
#   max_guest: 15,
#   cabin: 6,
#   yacht_image: "yacht1.jpg",
#   price_per_day: 1500,
#   description: "Host the party of a lifetime on our spacious party yacht with all the amenities you need."
# )

puts "seeded correctly"
