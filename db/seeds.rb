# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Yacht.destroy_all
Yacht.create!(
  user_id: 1,
  name: "Luxury Yacht 1",
  max_guest: 10,
  cabin: 5,
  yacht_image: "yacht1.jpg",
  price_per_day: 1000,
  description: "Experience luxury on the open waters with our spacious and elegant yacht."
)

User.create!(
  email: "owner@gmail.com", 
  password: "owner111"
)

User.create!(
  email: "buyer@gmail.com", 
  password: "buyer111"
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
