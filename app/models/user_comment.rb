class UserComment < ApplicationRecord
  belongs_to :place, counter_cache: :count_of_comments
  belongs_to :commentor, class_name: "User", foreign_key: "commentor_id", counter_cache: :comment_posteds
  validates :body, presence: true
end
