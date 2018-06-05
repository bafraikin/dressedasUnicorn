class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.string :name
      t.integer :tag_to_places_count


      t.timestamps
    end
  end
end
