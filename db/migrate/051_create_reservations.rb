class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.references :exam, foreign_key: true
      t.references :room, foreign_key: true
      t.datetime :start_time
      t.datetime :end_time
      t.string :created_by, limit: 50

      t.timestamps
    end
  end
end
