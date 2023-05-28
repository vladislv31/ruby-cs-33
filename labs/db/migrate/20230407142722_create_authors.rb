# frozen_string_literal: true

# This migration creates the authors table in the database.
class CreateAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :authors do |t|
      t.string :name
      t.string :second_name
      t.integer :age
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
