class Exam < ApplicationRecord
  belongs_to :owner, :class_name => 'Organization'
end
