class FavPlace < ApplicationRecord
  belongs_to :liked, class_name: :Place, foreign_key: :liked_id
  belongs_to :faver, class_name: :User, foreign_key: :faver_id
end
