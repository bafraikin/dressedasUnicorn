class CounterCacheForUserComment < ActiveRecord::Migration[5.2]
  def change

    add_column :users, :comment_posteds, :integer
    add_column :places, :count_of_comments, :integer
  end
end
