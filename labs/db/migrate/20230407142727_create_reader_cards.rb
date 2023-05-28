# frozen_string_literal: true

# This migration creates the reader_cards table in the database.
class CreateReaderCards < ActiveRecord::Migration[7.0]
  def change
    create_table :reader_cards do |t|
      t.string :number
      t.references :library, null: false, foreign_key: true

      t.timestamps
    end
  end
end
