class Room < ApplicationRecord
  belongs_to :building

  # Exams
  has_many :reservations
  has_many :exams, through: :reservations

  # Seats
  has_many :seats
end
