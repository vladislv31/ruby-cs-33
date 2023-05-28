# frozen_string_literal: true

# This migration creates the libraries table in the database.
class CreateLibraries < ActiveRecord::Migration[7.0]
  def change
    create_table :libraries do |t|
      t.string :name
      t.string :address

      t.timestamps
    end
  end
end
