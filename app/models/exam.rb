class Exam < ApplicationRecord
  belongs_to :owner, :class_name => 'Organization'

  # Enrollments
  has_many :enrollments
  has_many :candidates, through: :enrollments
end
