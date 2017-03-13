class Photo < ApplicationRecord
  # Direct associations

  belongs_to :accommodation

  belongs_to :points_of_interest

  belongs_to :restaurant

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations
  validates :user_id, presence: true

end
