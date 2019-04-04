class Room < ApplicationRecord
  belongs_to :building

  # Exams
  has_many :reservations
  has_many :exams, through: :reservations
end
