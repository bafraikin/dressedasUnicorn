class Tag < ApplicationRecord


  has_many :tag_to_places
  has_many :places, through: :tag_to_places


end
