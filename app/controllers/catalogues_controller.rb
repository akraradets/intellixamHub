require 'rqrcode'
class CataloguesController < ApplicationController
  layout "candidates"
  before_action :authenticate_candidate!, except: [:index, :show]
  before_action :set_exam, only: [:show, :enroll, :payment, :attach_new, :attach_remove, :cheat]
  before_action :set_enroll, only: [:payment, :attach_new, :cheat]
  before_action :set_evidences, only: [:attach]

  # GET /catalouges
  # GET /catalouges.json
  def index
    # @exams = Exam.all
    @exams = Exam.where('status = ?','Running')
  end
  
  # GET /catalouges/<exam.title>
  # GET /catalouges/<exam.title>.json
  def show
    if current_candidate.nil? == false and current_candidate.isEnrollTo(@exam)
      @enroll_infor = @exam.enrollments.find_by(candidate: current_candidate)
    end
    if @enroll_infor.seat.nil? == false
      
      @qr = RQRCode::QRCode.new( @enroll_infor.to_json, :size => 16 )
    end
  end
  
  # POST /catalouges/<exam.title>
  # POST /catalouges/<exam.title>.json
  def enroll
    if current_candidate.isEnrollTo(@exam)
      @enroll_infor = @exam.enrollments.find_by(candidate: current_candidate)
      @enroll_infor.destroy
      # @exam.candidates.delete(current_candidate)
    elsif
      @exam.candidates << current_candidate
      @enroll_infor = @exam.enrollments.find_by(candidate: current_candidate)
      @enroll_infor.status = "enrolled"
      @enroll_infor.ip = request.remote_ip
      @enroll_infor.paymentMethod = ""
      @enroll_infor.save
    end
    redirect_to catalogues_path(@exam.title)
  end

  # POST /catalouges/payment/<exam.title>
  # POST /catalouges/<exam.title>.json
  def payment
    @enroll_infor.status = "uploadDocument"
    @enroll_infor.paymentMethod = params[:paymentMethod]
    @enroll_infor.save
    redirect_to catalogues_path(@exam.title)
  end

  # POST
  def attach_new
    @evi = Evidence.new
    @evi.enrollment = @enroll_infor
    @evi.name = "paySlip"
    @evi.description = params[:paySlip].original_filename
    @evi.fileType = params[:paySlip].original_filename.split(".")[1]
    @evi.status = "Verifying"
    @evi.file.attach(params[:paySlip])
    @evi.save
    redirect_to catalogues_path(@exam.title)
    # render :show
  end

  #DELETE /catalogues/:title/attach/:id
  def attach_remove
    Evidence.find(params[:id]).destroy
    redirect_to catalogues_path(@exam.title)
    # render :show
  end

  #GET /catalogues/:title/cheat
  def cheat
    @enroll_infor.status = "Complete"
    @enroll_infor.save
    # Once the status change to Complete
    # Assign seat
    seat = @exam.getFirstEmptySeat
    seat.candidate = current_candidate
    seat.enrollment = @enroll_infor
    seat.save
    redirect_to catalogues_path(@exam.title)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exam
      @exam = Exam.find_by(title: params[:title])
    end

    def set_enroll
      # a = Exam.second.enrollments.find_by(candidate: Candidate.first)
      @enroll_infor = @exam.enrollments.find_by(candidate: current_candidate)
    end

    def set_evidences
      @evidences = @enroll_infor.evidences
    end
end
