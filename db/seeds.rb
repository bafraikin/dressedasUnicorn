# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Place.create(name: "blabla", address: "chouchou")
#require 'csv'


=begin
csv_text = File.read(Rails.root.join('lib', 'seeds', 'shopz.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  puts row.to_hash
  end
=end
Tag.destroy_all
tags = Tag.create([
  {id: 1, name: 'Homme'},
  {id: 2, name: 'Femme'},
  {id: 3, name: 'Enfants'},
  {id: 4, name: 'Mode'},
  {id: 5, name: 'Déco'},
  {id: 6, name: 'Concept Store'},
  {id: 7, name: 'Vêtements'},
  {id: 8, name: 'Chaussures'},
  {id: 9, name: 'Accessoire'},
])


#csv_text = File.read(Rails.root.join('lib', 'seeds', 'shopz.csv'))
#csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
#csv.each do |row|
#  puts row.to_hash
#  end

# ATTENTION #### A NE FAIRE QU'UNE FOIS !!!!! 
#  Tag.destroy_all
#  tags = Tag.create([
#    {id: 1, name: 'Homme'},
#    {id: 2, name: 'Femme'},
#    {id: 3, name: 'Enfant'},
#    {id: 4, name: 'Mode'},
#    {id: 5, name: 'Déco'},
#    {id: 6, name: 'ConceptStore'},
#    {id: 7, name: 'Vêtements'},
#    {id: 8, name: 'Chaussures'},
#    {id: 9, name: 'Accessoires'},
#  ])



# run rails db:seed pour le scrap/seed  faire en sorte que ça match les données d'une table

=begin require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'shopz.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Place.new
  t.shop = row[:Boutique]
  t.address = row[:Addresse]
  t.horaire = row[:Horaire]
  t.metro = row[:Metro]
  
  

  puts "#{t.shop}, #{t.address} saved"
end

puts "There are now #{Place.count} rows in the table"






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
