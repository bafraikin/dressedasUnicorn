class FavPlace < ApplicationRecord
  belongs_to :place, counter_cache: true 
  belongs_to :liker, class_name: "User", foreign_key: :liker_id, counter_cache: true
end
