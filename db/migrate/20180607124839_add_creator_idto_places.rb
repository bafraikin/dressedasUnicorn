class AddCreatorIdtoPlaces < ActiveRecord::Migration[5.2]
  def change
    add_reference :places, :users, foreign_key: true
    add_column :places, :description, :text
  end
end
