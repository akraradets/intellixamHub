class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.references :building, foreign_key: true
      t.string :name, limit: 50
      t.string :floor, limit: 3
      t.integer :max_row
      t.integer :max_column
      t.string :created_by, limit: 50
      t.string :updated_by, limit: 50

      t.timestamps
    end
  end
end
