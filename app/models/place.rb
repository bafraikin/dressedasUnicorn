
class Place < ApplicationRecord

  #reverse_geocoded_by :latitude, :longitude
  #after_validation :reverse_geocode


  has_many :tag_to_places 
  has_many :tags, through: :tag_to_places

  has_many :fav_places, foreign_key: :liked_place_id
  has_many :favers, through: :fav_places, source: :User
end
