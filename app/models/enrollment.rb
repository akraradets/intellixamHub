class Enrollment < ApplicationRecord
  belongs_to :exam
  belongs_to :candidate
end
