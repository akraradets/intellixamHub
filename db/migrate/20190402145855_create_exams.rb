class CreateExams < ActiveRecord::Migration[5.2]
  def change
    create_table :exams do |t|
      t.references :owner,          null: false
      t.string     :title,          null: false, limit: 50
      t.string     :description,                 limit: 500
      t.string     :format,                      limit: 30
      t.integer    :fee,            null: false
      t.integer    :max_enrollment, null: false
      t.string     :created_by,                  limit: 50
      t.string     :updated_by,                  limit: 50

      t.timestamps
    end
    add_foreign_key :exams, :organizations, column: :owner_id, primary_key: :id
  end
end
