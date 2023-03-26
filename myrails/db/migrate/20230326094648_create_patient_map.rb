class CreatePatientMap < ActiveRecord::Migration[7.0]
  def change
    create_table :patient_maps do |t|
      t.integer :year_created
      t.references :patients, foreign_key: true
      t.references :clinics, foreign_key: true

      t.timestamps
    end
  end
end
