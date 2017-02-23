class CreateRestaurantFavorites < ActiveRecord::Migration
  def change
    create_table :restaurant_favorites do |t|
      t.integer :restaurant_id
      t.integer :user_id

      t.timestamps

    end
  end
end
