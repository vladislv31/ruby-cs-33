# frozen_string_literal: true

# Controls the behavior for managing pdf downloads of models.
class PdfDownloaderController < ApplicationController
  def export_library
    libraries = Library.all
    data = []
    data << ['Name', 'Address', 'City', 'Zip Code', 'Street Address', 'Year']

    libraries.each do |library|
      data << [library.name, library.address, library.city,
               library.zip_code, library.street_address, library.year]
    end

    filepath = PdfGenerator.generate('libraries', data)

    send_file filepath, type: 'application/pdf', disposition: 'attachment'
  end

  def export_author
    authors = Author.includes(:book)
    data = []
    data << ['Name', 'Second Name', 'Age', 'Book Name']

    authors.each do |author|
      data << [author.name, author.second_name, author.age, author.book.title]
    end

    filepath = PdfGenerator.generate('authors', data)

    send_file filepath, type: 'application/pdf', disposition: 'attachment'
  end

  def export_book
    books = Book.includes(:library)
    data = []
    data << ['Title', 'Year', 'Library Name']

    books.each do |book|
      data << [book.title, book.year, book.library.name]
    end

    filepath = PdfGenerator.generate('books', data)

    send_file filepath, type: 'application/pdf', disposition: 'attachment'
  end

  def export_genre
    genres = Genre.includes(:book)
    data = []
    data << ['Name', 'Book Title']

    genres.each do |genre|
      data << [genre.name, genre.book.title]
    end

    filepath = PdfGenerator.generate('genres', data)

    send_file filepath, type: 'application/pdf', disposition: 'attachment'
  end

  def export_reader_card
    reader_cards = ReaderCard.includes(:library)
    data = []
    data << ['Number', 'Library Name']

    reader_cards.each do |reader_card|
      data << [reader_card.number, reader_card.library.name]
    end

    filepath = PdfGenerator.generate('reader_cards', data)

    send_file filepath, type: 'application/pdf', disposition: 'attachment'
  end
end
