class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.string :name
      t.float :longitude
      t.float :latitude
      t.string :address
      t.integer :average_price
      t.belongs_to :map
      t.belongs_to :town
      t.integer :tag_to_places_count



      t.timestamps
    end
  end
end
