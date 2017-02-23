class PointsOfInterestsFavorite < ApplicationRecord
  # Direct associations

  belongs_to :points_of_interest

  belongs_to :user

  # Indirect associations

  # Validations

end
