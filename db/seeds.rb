#  This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Booking.all.destroy_all
Yacht.all.destroy_all
User.all.destroy_all
Review.all.destroy_all

puts "destroyed seeds"

puts "creating users"

all_users_id = []

user_1 = User.create!(
email: "owner@gmail.com",
password: "owner111"
)

user_2 = User.create!(
email: "buyer@gmail.com",
password: "buyer111"
)


User.all.each do |user|
  all_users_id << user.id
end

puts "creating yachts"
yacht_1 = Yacht.create!(
  user_id: all_users_id.sample,
  name: "Thousand Sunny",
  max_guest: 10,
  cabin: 5,
  yacht_image: "yacht1.jpg",
  yacht_interior_image: "yacht1_interior.jpg",
  yacht_cabin_image: "yacht1_cabin.jpg",
  price_per_day: 1000,
  description: "Experience luxury on the open waters with our spacious and elegant yacht.",
  address: "Tourlos, Greece"
)

yacht_2 = Yacht.create!(
  user_id: all_users_id.sample,
  name: "Elegant Cruiser",
  max_guest: 8,
  cabin: 4,
  yacht_image: "yacht2.jpg",
  yacht_interior_image: "yacht2_interior.jpg",
  yacht_cabin_image: "yacht2_cabin.jpg",
  price_per_day: 850,
  description: "Set sail in style on our elegant cruiser with stunning ocean views.",
  address: "Obala bb, Tivat 85320, Montenegro"
)

yacht_3 = Yacht.create!(
  user_id: all_users_id.sample,
  name: "Ocean Paradise",
  max_guest: 12,
  cabin: 6,
  yacht_image: "yacht3.jpg",
  yacht_interior_image: "yacht3_interior.jpg",
  yacht_cabin_image: "yacht3_cabin.jpg",
  price_per_day: 1200,
  description: "Embark on a luxurious journey aboard our exquisite Ocean Paradise yacht.",
  address: "Bristol, United Kingdom"

)
yacht_4 = Yacht.create!(
  user_id: all_users_id.sample,
  name: "Sunset Serenity",
  max_guest: 6,
  cabin: 3,
  yacht_image: "yacht4.jpg",
  yacht_interior_image: "yacht4_interior.jpg",
  yacht_cabin_image: "yacht4_cabin.jpg",
  price_per_day: 750,
  description: "Experience tranquility and stunning sunsets on our Sunset Serenity yacht.",
  address: "Kilverts Wharf, England"
)

yacht_5 = Yacht.create!(
  user_id: all_users_id.sample,
  name: "Royal Voyager",
  max_guest: 15,
  cabin: 7,
  yacht_image: "yacht5.jpg",
  yacht_interior_image: "yacht5_interior.jpg",
  yacht_cabin_image: "yacht5_cabin.jpg",
  price_per_day: 1500,
  description: "Sail like royalty aboard our spacious and opulent Royal Voyager yacht.",
  address: "Piombino, Italy"

)
yacht_6 = Yacht.create!(
  user_id: all_users_id.sample,
  name: "Royal Mermaid",
  max_guest: 15,
  cabin: 7,
  yacht_image: "yacht6.jpg",
  yacht_interior_image: "yacht6_interior.jpg",
  yacht_cabin_image: "yacht6_cabin.jpg",
  price_per_day: 500,
  description: "Sail like royalty aboard our spacious and opulent Royal Mermaid.",
  address: "Sant Antoni de Portmany, Spain"
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

puts "seeding reviews"

Review.create!(booking_id: booking_1.id,
  yacht_id: yacht_1.id,
  rating: 10,
  comment: "This yacht was so big, I thought I was on a cruise ship. But then I realized I was the only one on board, and I started to feel a little seasick."
)

Review.create!(booking_id: booking_2.id,
  yacht_id: yacht_2.id,
  rating: 10,
  comment: "This yacht was so big, I thought I was on a cruise ship. But then I realized I was the only one on board, and I started to feel a little seasick."
)

Review.create!(booking_id: booking_1.id,
  yacht_id: yacht_3.id,
  rating: 10,
  comment: "This yacht was so big, I thought I was on a cruise ship. But then I realized I was the only one on board, and I started to feel a little seasick."
)

Review.create!(booking_id: booking_1.id,
  yacht_id: yacht_4.id,
  rating: 10,
  comment: "This yacht was so big, I thought I was on a cruise ship. But then I realized I was the only one on board, and I started to feel a little seasick."
)

Review.create!(booking_id: booking_1.id,
  yacht_id: yacht_5.id,
  rating: 10,
  comment: "This yacht was so big, I thought I was on a cruise ship. But then I realized I was the only one on board, and I started to feel a little seasick."
)

Review.create!(booking_id: booking_1.id,
  yacht_id: yacht_6.id,
  rating: 10,
  comment: "This yacht was so big, I thought I was on a cruise ship. But then I realized I was the only one on board, and I started to feel a little seasick."
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
