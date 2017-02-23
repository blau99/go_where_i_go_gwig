class CreatePointsOfInterestsFavorites < ActiveRecord::Migration
  def change
    create_table :points_of_interests_favorites do |t|
      t.integer :points_of_interest_id
      t.integer :user_id

      t.timestamps

    end
  end
end
