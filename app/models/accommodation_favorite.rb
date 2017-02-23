class AccommodationFavorite < ApplicationRecord
  # Direct associations

  belongs_to :accommodation

  belongs_to :user

  # Indirect associations

  # Validations

end
