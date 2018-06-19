class CreateUserComments < ActiveRecord::Migration[5.2]
  def change
    create_table :user_comments do |t|

      t.belongs_to :place, index: true
      t.belongs_to :commentor, index: true
      t.text :body

      t.timestamps
    end
  end
end
