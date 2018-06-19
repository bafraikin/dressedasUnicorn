class AddCounterCacheForLike < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :fav_places_count, :integer
    add_column :places, :fav_places_count, :integer
  end
end
