class CreateAccommodationFavorites < ActiveRecord::Migration
  def change
    create_table :accommodation_favorites do |t|
      t.integer :accommodation_id
      t.integer :user_id

      t.timestamps

    end
  end
end
