json.extract! room, :id, :building_id, :name, :floor, :max_row, :max_column, :created_by, :updated_by, :created_at, :updated_at
json.url room_url(room, format: :json)
