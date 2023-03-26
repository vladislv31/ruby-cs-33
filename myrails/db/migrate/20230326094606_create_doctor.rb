class CreateDoctor < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors do |t|
      t.string :surname
      t.string :name
      t.string :patronymic
      t.references :departments, foreign_key: true
      t.references :specialities, foreign_key: true

      t.timestamps
    end
  end
end
