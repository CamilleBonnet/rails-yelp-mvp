# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


category = ["chinese", "italian", "japanese", "french", "belgian"]
nb_resto = Restaurant.count

20.times do
  # resto = Restaurant.new(name: Faker::Beer.name, address: Faker::Address.street_address, phone_number: Faker::PhoneNumber.phone_number, category: category[rand(4)])
  # resto.save

  review = Review.new(content: Faker::ChuckNorris.fact, rating: rand(6))
  review.restaurant = Restaurant.find(rand(nb_resto) + 1)
  review.save
end

puts "Database seeded !"
