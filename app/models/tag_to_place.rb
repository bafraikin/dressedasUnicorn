class TagToPlace < ApplicationRecord
  belongs_to :place
  belongs_to :tag
end
