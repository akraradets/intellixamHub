class Enrollment < ApplicationRecord
  belongs_to :exam
  belongs_to :candidate
  
  has_many :evidences, dependent: :destroy, :class_name => 'Evidence', :foreign_key => 'enrollment_id'
  has_one :seat

  before_destroy :release_seat

  def hasEvidence(name)
    !evidences.find_by(name: name).nil?
  end

  def getEvidence(name)
    evidences.find_by(name: name)
  end

  def release_seat
    seat.candidate = nil
    seat.enrollment = nil
    seat.save
  end
end
