class CreateBuildings < ActiveRecord::Migration[5.2]
  def change
    create_table :buildings do |t|
      t.string :name, limit: 50
      t.string :address, limit: 200
      t.decimal :latitude, precision: 9, scale: 6
      t.decimal :longitude, precision: 9, scale: 6
      t.string :created_by, limit: 50
      t.string :updated_by, limit: 50

      t.timestamps
    end
  end
end
