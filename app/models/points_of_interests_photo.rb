class PointsOfInterestsPhoto < ApplicationRecord
  # Direct associations

  belongs_to :points_of_interests,
             :foreign_key => "points_of_interest_id"

  # Indirect associations

  # Validations

end
