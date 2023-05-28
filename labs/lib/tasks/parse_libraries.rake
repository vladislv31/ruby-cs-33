# frozen_string_literal: true

require 'nokogiri'
require 'open-uri'
require 'faker'

EXCLUDED_STRINGS = [
  'Scientific and Technical Library',
  '"What is a tool library?"',
  "American Library Association's list of largest US libraries",
  'Special library',
  'Library and information scientist',
  'Library and information science',
  'Library history',
  'Library instruction',
  'Library management',
  'Library publishing',
  'History of library science',
  'Library associations',
  'Library schools',
  'Tool schools',
  'Category:Library science'
].freeze

desc 'Scrape library names from Wikipedia and add to database'
task scrape_libraries: :environment do
  # Fetch the HTML content from the URL
  url = 'https://en.wikipedia.org/wiki/List_of_libraries'
  html = URI.parse(url).open

  doc = Nokogiri::HTML(html)

  relevant_library_names = []
  doc.css('li a').each do |element|
    text = element.text.strip
    next unless (text.include?('library') || text.include?('Library')) && EXCLUDED_STRINGS.exclude?(text)

    relevant_library_names << text
  end

  relevant_library_names.each do |name|
    address = Faker::Address.full_address
    Library.create(name: name, address: address)
  end
end
