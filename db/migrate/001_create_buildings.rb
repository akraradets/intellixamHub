class CreateBuildings < ActiveRecord::Migration[5.2]
  def change
    create_table :buildings do |t|
      t.string :name, limit: 50
      t.string :address, limit: 200

      t.timestamps
    end
  end
end
