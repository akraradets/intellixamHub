class Exam < ApplicationRecord
  belongs_to :owner, :class_name => 'Organization'

    # Enrollments
  has_many :enrollments
  has_many :candidates, through: :enrollments

  # Reservations
  has_many :reservations
  has_many :rooms, through: :reservations

  def enroll_timeslot
    printString = ""
    enroll_start = self.enroll_start
    enroll_end = self.enroll_end
    if enroll_start < DateTime.now
      printString = "now - "
    else
      printString = enroll_start.strftime("%d %b %Y %H:%M") + " - "
    end

    return printString = printString + enroll_end.strftime("%d %b %Y %H:%M")
  end
end
