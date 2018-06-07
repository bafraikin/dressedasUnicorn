# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'shopz.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Place.create
  t.boutique = row[:Boutique]
  t.address = row[:Addresse]
  t.horaire = row[:Horaire]
  t.metro = row[:Metro]
  
  
  puts "#{t.boutique}, #{t.address} saved"
end

puts "There are now #{Place.count} rows in the transactions table"

#run rails db:seed les kheys





=begin 
require 'faker'
index = 0
3.times do 
  700.times do 
    puts "ça y'est #{index}"
    Place.create(name: Faker::Book.author, longitude: Faker::Address.longitude, latitude: Faker::Address.latitude)
    index += 1
  end
end
=end