class Exam < ApplicationRecord
  belongs_to :owner, :class_name => 'Organization'

  # Enrollments
  has_many :enrollments
  has_many :candidates, through: :enrollments

  # Reservations
  has_many :reservations
  has_many :rooms, through: :reservations
end
