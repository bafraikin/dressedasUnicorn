
class Place < ApplicationRecord

  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode
  geocoded_by :address


  has_many :tag_to_places 
  has_many :tags, through: :tag_to_places 
end
