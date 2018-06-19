class AddCounterCacheForLike < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :liked_places_count, :integer
    add_column :places, :liked_places_count, :integer
  end
end
