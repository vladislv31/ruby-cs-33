# frozen_string_literal: true

# Adds a `year` column to the `libraries` table in the database
class AddYearToLibraries < ActiveRecord::Migration[7.0]
  def change
    add_column :libraries, :year, :integer
  end
end
