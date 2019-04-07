class CreateSeats < ActiveRecord::Migration[5.2]
  def change
    create_table :seats do |t|
      t.references :reservation, foreign_key: true
      t.references :enrollment, foreign_key: true
      t.references :candidate, foreign_key: true
      t.references :room, foreign_key: true
      t.string :name, limit: 50
      t.integer :row
      t.integer :column
      t.boolean :is_extra
      t.string :created_by, limit: 50
      t.string :updated_by, limit: 50

      t.timestamps
    end
  end
end
