class RemoveFalseColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :tag_to_places_count, :integer
  end
end
