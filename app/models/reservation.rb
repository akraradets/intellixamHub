class Reservation < ApplicationRecord
  belongs_to :exam
  belongs_to :room
end
