# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'
index = 0
3.times do 
  700.times do 
    puts "ça y'est #{index}"
    Place.create(name: Faker::Book.author, longitude: Faker::Address.latitude, latitude: Faker::Address.longitude)
    index += 1
  end
end
