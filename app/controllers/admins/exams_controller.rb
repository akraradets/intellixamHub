class Admins::ExamsController < ApplicationController
  layout "admins"
  before_action :authenticate_admin!
  before_action :set_exam, only: [:show, :checkin, :checkin_post]
  before_action :set_enrollment, only: [:checkin]

  def index
    @exams = Exam.all
  end

  def show
    # for now, lets just check-in
    redirect_to admins_exam_checkin_path(@exam.title)
  end

  def checkin

  end

  def checkin_post
    @enroll = @exam.enrollments.find(params[:enroll_id])
    if @enroll.isCheckin
      @enroll.isCheckin = false
    else
      @enroll.isCheckin = true
    end
    @enroll.save
    redirect_to admins_exam_checkin_path(@exam.title)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exam
      @exam = Exam.find_by(title: params[:title])
    end

    def set_enrollment
      @enrollments = @exam.enrollments
    end
end
