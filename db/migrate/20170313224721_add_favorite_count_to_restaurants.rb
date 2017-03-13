class AddFavoriteCountToRestaurants < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :favorites_count, :integer
  end
end
