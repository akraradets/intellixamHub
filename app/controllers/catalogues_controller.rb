class CataloguesController < ApplicationController
  layout "candidates"

  # GET /
  # GET /catalouges.json
  def index
    # @exams = Exam.all
    @exams = Exam.where('status = ?','Running')

  end
  
end
