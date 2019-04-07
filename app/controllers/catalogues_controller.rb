class CataloguesController < ApplicationController
  layout "candidates"
  before_action :authenticate_candidate!, only: [:enroll]
  before_action :set_exam, only: [:show]

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
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exam
      @exam = Exam.find_by(title: params[:title])
    end
end
