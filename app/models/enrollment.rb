class Enrollment < ApplicationRecord
  belongs_to :exam
  belongs_to :candidate
  
  has_many :evidences, dependent: :destroy, :class_name => 'Evidence', :foreign_key => 'enrollment_id'

  def hasEvidence(name)
    !evidences.find_by(name: name).nil?
  end

  def getEvidence(name)
    evidences.find_by(name: name)
  end
end
