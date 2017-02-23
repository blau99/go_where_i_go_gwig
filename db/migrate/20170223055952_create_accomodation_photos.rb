class CreateAccomodationPhotos < ActiveRecord::Migration
  def change
    create_table :accomodation_photos do |t|
      t.integer :accommodation_id
      t.integer :user_id
      t.text :caption

      t.timestamps

    end
  end
end
