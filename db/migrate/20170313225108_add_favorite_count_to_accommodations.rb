class AddFavoriteCountToAccommodations < ActiveRecord::Migration[5.0]
  def change
    add_column :accommodations, :favorites_count, :integer
  end
end
