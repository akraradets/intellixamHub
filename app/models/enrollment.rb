class Enrollment < ApplicationRecord
  belongs_to :exam
  belongs_to :candidate
  
  has_many :evidences

  def hasEvidence(name)
    
  end
end
