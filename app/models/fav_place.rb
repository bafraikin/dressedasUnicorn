class FavPlace < ApplicationRecord
  belongs_to :place, counter_cache: :nb_of_likers 
  belongs_to :liker, class_name: "User", foreign_key: :liker_id, counter_cache: :nb_of_liked_places
end
