class CreateExams < ActiveRecord::Migration[5.2]
  def change
    create_table :exams do |t|
      t.references :owner,  null: false
      t.string :title, limit: 50
      t.string :description, limit: 500
      t.string :format, limit: 30
      t.integer :fee
      t.integer :max_enrollment
      t.string :status, limit: 50
      t.datetime :start_time
      t.datetime :end_time
      t.string :created_by, limit: 50
      t.string :updated_by, limit: 50

      t.timestamps
    end
    add_foreign_key :exams, :organizations, column: :owner_id, primary_key: :id
  end
end
