class CreateDepartment < ActiveRecord::Migration[7.0]
  def change
    create_table :departments do |t|
      t.string :name
      t.references :clinics, foreign_key: true

      t.timestamps
    end
  end
end
