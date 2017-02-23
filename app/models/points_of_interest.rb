class PointsOfInterest < ApplicationRecord
  # Direct associations

  has_many   :points_of_interests_favorites,
             :dependent => :destroy

  has_many   :points_of_interests_photos,
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  # Validations

end
