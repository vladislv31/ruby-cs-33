# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

# Create 10 libraries
10.times do
  library = Library.create(name: Faker::Company.unique.name, address: Faker::Address.full_address)

  # Create 5 books for each library
  3.times do
    book = library.books.create(title: Faker::Book.unique.title,
                                year: Faker::Number.between(from: 1900, to: 2023))

    # Create an author and genres for each book
    book.authors.create(name: Faker::Name.unique.name, second_name: Faker::Name.unique.name,
                        age: Faker::Number.between(from: 20, to: 80))
    book.genres.create(name: Faker::Book.genre)
  end

  # Create a reader card for each library
  ReaderCard.create(number: Faker::Number.unique.number(digits: 8).to_s, library: library)
end

# Create 5 users
5.times do
  User.create(name: Faker::Name.unique.name, email: Faker::Internet.unique.email)
end
