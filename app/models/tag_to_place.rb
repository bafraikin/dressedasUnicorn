class TagToPlace < ApplicationRecord
  belongs_to :place, counter_cache: true
  belongs_to :tag, counter_cache: true
end
