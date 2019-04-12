class Evidence < ApplicationRecord
  belongs_to :enrollment
  has_one_attached :file
end
