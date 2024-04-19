class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.text :body, null: false
      t.float :latitude
      t.float :longitude
      t.string :address
      t.timestamps
    end
  end
end
