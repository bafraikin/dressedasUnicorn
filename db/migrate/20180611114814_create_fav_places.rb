class CreateFavPlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :fav_places do |t|
      t.belongs_to :place, index: true
      t.belongs_to :liker, index: true

      t.timestamps
    end
  end
end
