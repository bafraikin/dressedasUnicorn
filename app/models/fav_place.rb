class FavPlace < ApplicationRecord
  belongs_to :place
  belongs_to :liker, class_name: "User", foreign_key: :liker_id
end