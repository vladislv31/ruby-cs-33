class CreateClinic < ActiveRecord::Migration[7.0]
  def change
    create_table :clinics do |t|
      t.string :name
      t.string :address
      t.string :city

      t.timestamps
    end
  end
end
