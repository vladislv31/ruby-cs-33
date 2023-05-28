# frozen_string_literal: true

require 'smarter_csv'
require 'faker'

desc 'Import library data from CSV file'
task import_libraries: :environment do
  file_path = 'db/csv_files/libraries_6.csv'

  SmarterCSV.process(file_path, { chunk_size: 1000 }) do |chunk|
    libraries = chunk.map do |row|
      {
        street_address: row[:street_address],
        city: row[:city],
        zip_code: row[:zip_code]
      }
    end

    libraries.each do |library|
      Library.create(
        name: Faker::Name.name,
        address: Faker::Address.full_address,
        year: Faker::Number.between(from: 1900, to: 2022),
        street_address: library[:street_address],
        city: library[:city],
        zip_code: library[:zip_code]
      )
    end
  end
end
