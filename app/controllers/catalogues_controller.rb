class CataloguesController < ApplicationController
  layout "candidates"
  before_action :set_exam, only: [:show]

  # GET /catalouges
  # GET /catalouges.json
  def index
    # @exams = Exam.all
    @exams = Exam.where('status = ?','Running')
  end
  
  # GET /catalouges/1
  # GET /catalouges/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exam
      @exam = Exam.find_by(title: params[:title])
    end
end
