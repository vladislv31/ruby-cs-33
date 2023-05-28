# frozen_string_literal: true

require 'smarter_csv'

desc 'Import data from CSV file to lib_test'
task import_lib_tests: :environment do
  file_path = 'db/csv_files/libraries_6.csv'

  threads = []
  mutex = Mutex.new

  SmarterCSV.process(file_path, { chunk_size: 1000 }) do |chunk|
    thread = Thread.new do
      lib_tests = extract_lib_tests(chunk)

      mutex.synchronize do
        create_lib_tests(lib_tests)
      end
    end

    threads << thread
  end

  join_threads(threads)
end

def extract_lib_tests(chunk)
  chunk.map(&method(:map_csv_row_to_lib_data))
       .map(&method(:map_lib_data_to_lib_test))
end

def map_csv_row_to_lib_data(row)
  {
    library_name: row[:library_name],
    submission_year: row[:submission_year],
    county: row[:county],
    street_address: row[:street_address],
    city: row[:city],
    zip_code: row[:zip_code]
  }
end

def map_lib_data_to_lib_test(library)
  {
    name: library[:library_name],
    address: library[:county],
    year: library[:submission_year],
    street_address: library[:street_address],
    city: library[:city],
    zip_code: library[:zip_code]
  }
end

def create_lib_tests(lib_tests)
  lib_tests.each { |lib_test| LibTest.create(lib_test) }
end

def join_threads(threads)
  threads.each(&:join)
end
