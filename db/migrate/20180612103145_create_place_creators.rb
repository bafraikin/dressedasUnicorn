class CreatePlaceCreators < ActiveRecord::Migration[5.2]
  def change
    create_table :place_creators do |t|

t.belongs_to :creator, index: :true
      t.belongs_to :place, index: :true
      t.timestamps
    end
  end
end
