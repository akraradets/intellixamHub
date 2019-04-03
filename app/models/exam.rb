class Exam < ApplicationRecord
  belongs_to :owner

  # Enrollments
  has_many :enrollments
  has_many :candidates, through: :enrollments
end
