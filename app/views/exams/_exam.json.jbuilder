json.extract! exam, :id, :owner_id, :title, :description, :format, :fee, :max_enrollment, :status, :created_by, :updated_by, :created_at, :updated_at
json.url exam_url(exam, format: :json)