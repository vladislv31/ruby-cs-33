class CreatePatient < ActiveRecord::Migration[7.0]
  def change
    create_table :patients do |t|
      t.string :surname
      t.string :name
      t.string :patronymic

      t.timestamps
    end
  end
end
