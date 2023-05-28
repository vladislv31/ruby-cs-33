# frozen_string_literal: true

require 'csv'
require 'faker'

# Controls the behavior for managing csv files of libraries.
class LibrariesCsvController < ApplicationController
  def export
    file_path = Rails.root.join('db/csv_files/libraries.csv')
    library_data = build_data_for_csv
    write_library_data_to_csv_file(library_data, file_path)

    redirect_to libraries_path
  rescue StandardError => e
    flash[:error] = "There was an error while exporting the data to CSV: #{e.message}"
    redirect_to libraries_path
  end

  private

  def build_data_for_csv
    Library.all.map do |library|
      {
        'Library Name' => library.name,
        'Address' => library.address,
        'Year' => library.year || generate_random_year,
        'Street Address' => library.street_address || generate_random_street_address,
        'City' => library.city || generate_random_city,
        'Zip Code' => library.zip_code || generate_random_zip_code
      }
    end
  end

  def generate_random_year
    Faker::Number.between(from: 1900, to: Time.zone.today.year)
  end

  def generate_random_street_address
    Faker::Address.street_address
  end

  def generate_random_city
    Faker::Address.city
  end

  def generate_random_zip_code
    Faker::Address.zip_code
  end

  def write_library_data_to_csv_file(library_data, file_path)
    CSV.open(file_path, 'w', write_headers: true, headers: library_data.first.keys) do |csv|
      library_data.each { |library| csv << library.values }
    end
  end
end
