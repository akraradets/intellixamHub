class CreateEvidences < ActiveRecord::Migration[5.2]
  def change
    create_table :evidences do |t|
      t.references :enrollment, foreign_key: true
      t.string :name, limit: 100
      t.string :description, limit: 100
      t.string :fileType, limit: 10
      t.integer :fileSize
      t.string :status, limit: 20
      t.string :created_by, limit: 50
      t.string :updated_by, limit: 50

      t.timestamps
    end
  end
end
