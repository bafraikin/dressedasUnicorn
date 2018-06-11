
class Place < ApplicationRecord

  #reverse_geocoded_by :latitude, :longitude
  #after_validation :reverse_geocode


  has_many :tag_to_places 
  has_many :tags, through: :tag_to_places

  belongs_to :creator, class_name: "User"
end
