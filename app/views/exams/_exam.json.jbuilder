json.extract! exam, :id, :owner_id, :title, :code, :description, :format, :fee, :max_enrollment, :status, :enroll_start, :enroll_end, :exam_start, :exam_end, :created_by, :updated_by, :created_at, :updated_at
json.url exam_url(exam, format: :json)
