class CataloguesController < ApplicationController
  layout "candidates"
  before_action :authenticate_candidate!, only: [:enroll]
  before_action :set_exam, only: [:show, :enroll]

  # GET /catalouges
  # GET /catalouges.json
  def index
    # @exams = Exam.all
    @exams = Exam.where('status = ?','Running')
  end
  
  # GET /catalouges/<exam.title>
  # GET /catalouges/<exam.title>.json
  def show
  end
  
  # GET /catalouges/<exam.title>
  # GET /catalouges/<exam.title>.json
  def enroll
    if current_candidate.isEnrollTo(@exam)
      @exam.candidates.delete(current_candidate)
    elsif
      @exam.candidates << current_candidate
    end
    render :show
    # respond_to do |format|
    #   if @exam.update(exam_params)
    #     format.html { redirect_to @exam, notice: 'Exam was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @exam }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @exam.errors, status: :unprocessable_entity }
    #   end
    # end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exam
      @exam = Exam.find_by(title: params[:title])
    end
end
