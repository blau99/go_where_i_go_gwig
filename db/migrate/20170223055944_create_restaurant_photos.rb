class CreateRestaurantPhotos < ActiveRecord::Migration
  def change
    create_table :restaurant_photos do |t|
      t.integer :restaurant_id
      t.integer :user_id
      t.text :caption

      t.timestamps

    end
  end
end
