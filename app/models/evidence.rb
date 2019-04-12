class Evidence < ApplicationRecord
  belongs_to :enrollment
  has_one_attached :file

  def attachDate
    return created_at.strftime("%d %b %Y %H:%M")
  end
end
