class AddFavoriteCountToPointsOfInterests < ActiveRecord::Migration[5.0]
  def change
    add_column :points_of_interests, :favorites_count, :integer
  end
end
