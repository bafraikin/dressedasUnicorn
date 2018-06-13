
class Place < ApplicationRecord

  #reverse_geocoded_by :latitude, :longitude
  #after_validation :reverse_geocode


  has_many :tag_to_places 
  has_many :tags, through: :tag_to_places

  has_many :fav_places
  has_many :likers, through: :fav_places

  has_many :place_creators
  has_many :creators, through: :place_creators

end
