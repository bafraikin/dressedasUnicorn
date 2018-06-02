class CreateTagToPlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :tag_to_places do |t|
      t.belongs_to :place, index: :true
      t.belongs_to :tag, index: :true

      t.timestamps
    end
  end
end
