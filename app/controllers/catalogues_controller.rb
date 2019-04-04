class CataloguesController < ApplicationController
  layout "candidates"

  # GET /
  # GET /catalouges.json
  def index
    @exams = Exam.all
  end
  
end
