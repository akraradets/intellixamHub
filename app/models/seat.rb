class Seat < ApplicationRecord
  belongs_to :reservation
  belongs_to :room
  belongs_to :enrollment, optional: true
  belongs_to :candidate, optional: true
end
