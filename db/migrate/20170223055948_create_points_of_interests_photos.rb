class CreatePointsOfInterestsPhotos < ActiveRecord::Migration
  def change
    create_table :points_of_interests_photos do |t|
      t.integer :points_of_interest_id
      t.integer :user_id
      t.text :caption

      t.timestamps

    end
  end
end
