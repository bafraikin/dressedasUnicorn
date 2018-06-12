class PlaceCreator < ApplicationRecord
  belongs_to :place, counter_cache: true
  belongs_to :creator, class_name: "User", foreign_key: :creator_id, counter_cache: true
end
