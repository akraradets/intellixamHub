class Candidate < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
  
  # Enrollments
  has_many :enrollments
  has_many :exams, through: :enrollments

  #myFiles
  has_many_attached :myFiles


  def isEnrollTo(exam)
    !enrollments.find_by(exam: exam).nil?
  end
end
