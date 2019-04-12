class CreateEnrollments < ActiveRecord::Migration[5.2]
  def change
    create_table :enrollments do |t|
      t.references :exam, foreign_key: true
      t.references :candidate, foreign_key: true
      t.string :status, limit: 50
      t.inet :ip
      t.string :paymentMethod, limit: 20
      t.timestamps
    end
  end
end
