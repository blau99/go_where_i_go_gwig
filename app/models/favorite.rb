class Favorite < ApplicationRecord
  # Direct associations

  belongs_to :accommodation,
             :counter_cache => true

  belongs_to :points_of_interest,
             :counter_cache => true

  belongs_to :restaurant,
             :counter_cache => true

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

end
