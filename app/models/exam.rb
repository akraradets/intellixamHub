class Exam < ApplicationRecord
  belongs_to :owner, :class_name => 'Organization'

  # Enrollments
  has_many :enrollments
  has_many :candidates, through: :enrollments

  # Reservations
  has_many :reservations
  has_many :rooms, through: :reservations
  has_many :seats, through: :reservations

  def exam_timeslot
    return exam_start.strftime("%d %b %Y %H:%M") + " - " + exam_end.strftime("%d %b %Y %H:%M")
  end

  def exam_duration
    mins = (exam_end - exam_start) / 60
    return mins.to_i
  end

  def enroll_timeslot
    printString = ""
    if enroll_start < DateTime.now
      printString = "now - "
    else
      printString = enroll_start.strftime("%d %b %Y %H:%M") + " - "
    end

    return printString = printString + enroll_end.strftime("%d %b %Y %H:%M")
  end

  def getLocation
    url = "https://www.google.com/maps/embed/v1/place?key=AIzaSyBeHvnqrJVitdxbpR7FhysBzo_IVfCZtTg&q="
    url = url + rooms[0].building.latitude.to_s + "," + rooms[0].building.longitude.to_s
    tag = '<iframe width="150" height="150" frameborder="0" style="border:0" src='+url+' allowfullscreen></iframe>'
    return tag
  end

  def getAddress
    return rooms.first.building.address
  end

  def getFirstEmptySeat
    seats.where(enrollment: nil).first
  end

end
