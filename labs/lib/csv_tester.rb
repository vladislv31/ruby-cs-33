# frozen_string_literal: true

require 'csv'
require 'faker'

file_path = 'db/csv_files/libraries_6.csv'
csv_text = File.read(file_path)
csv = CSV.parse(csv_text, headers: true)

# csv.each do |row|
#   #puts "Name: #{Faker::Name.name}"
#   #puts "Address: #{Faker::Address.full_address}"
#   #puts "Year: #{Faker::Number.between(from: 1900, to: 2022)}"
#   puts "Street Address: #{row["Street Address"]}"
#   puts "City: #{row["City"]}"
#   puts "Zip Code: #{row["Zip Code"]}"
#   puts "\n"
# end
count = 0
csv.each_with_index do |row, index|
  break if index >= csv.length / 300

  # puts "Name: #{Faker::Name.name}"
  # puts "Address: #{Faker::Address.full_address}"
  # puts "Year: #{Faker::Number.between(from: 1900, to: 2022)}"
  Rails.logger.debug count
  count += 1
  Rails.logger.debug { "Street Address: #{row['Street Address']}" }
  Rails.logger.debug { "City: #{row['City']}" }
  Rails.logger.debug { "Zip Code: #{row['Zip Code']}" }
  Rails.logger.debug "\n"
end
