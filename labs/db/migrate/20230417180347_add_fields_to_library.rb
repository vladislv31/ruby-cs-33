# frozen_string_literal: true

# Adds street_address, city, and zip_code columns to the libraries table
class AddFieldsToLibrary < ActiveRecord::Migration[7.0]
  def change
    change_table :libraries, bulk: true do |t|
      t.string :street_address
      t.string :city
      t.string :zip_code
    end
  end
end
