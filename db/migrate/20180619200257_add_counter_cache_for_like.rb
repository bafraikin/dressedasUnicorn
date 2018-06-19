class AddCounterCacheForLike < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nb_of_liked_places, :integer
    add_column :places, :nb_of_likers, :integer
  end
end
