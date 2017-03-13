class CreateBestDishes < ActiveRecord::Migration
  def change
    create_table :best_dishes do |t|
      t.integer :restaurant_id
	  t.string :image

      t.timestamps

    end
  end
end
