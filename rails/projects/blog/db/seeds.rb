# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

5.times do |i|
  User.create(name: "Name ##{i}",gender: ["male", "false"].shuffle.first, age: rand(18..30), address: "Address ##{i}", terms_and_conditions: [true,false].shuffle.first)
end

