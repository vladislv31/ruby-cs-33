# frozen_string_literal: true

# Create table for adding some data
class CreateLibTests < ActiveRecord::Migration[7.0]
  def change
    create_table :lib_tests do |t|
      t.string :name
      t.string :address
      t.integer :year
      t.string :street_address
      t.string :city
      t.string :zip_code

      t.timestamps
    end
  end
end
