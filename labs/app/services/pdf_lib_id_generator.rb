# frozen_string_literal: true

require 'prawn'
require 'prawn/table'

# This class represents a PDF library ID generator that can be used to generate library IDs for PDFs.
class PdfLibIdGenerator
  def self.generate_pdf(library_id, photo_path = nil)
    library = Library.includes(books: %i[authors genres]).find(library_id)
    generate_pdf_document(library, photo_path)
  end

  def self.generate_pdf_document(library, photo_path = nil)
    Prawn::Document.generate("library_#{library.id}.pdf") do |pdf|
      set_library_information(pdf, library)
      add_photo(pdf, photo_path) if photo_path && File.exist?(photo_path)
      add_books(pdf, library.books)
      save_pdf_file(library.id, pdf.render)
    end
  end

  def self.set_library_information(pdf, library)
    pdf.font_size 20
    pdf.text "Library Information: #{library.name}", align: :center
    pdf.move_down 20

    pdf.font_size 14
    pdf.text "Address: #{library.address}, #{library.city} #{library.zip_code}"
    pdf.text "Year Founded: #{library.year}"
    pdf.move_down 20
  end

  def self.add_photo(pdf, photo_path)
    pdf.image photo_path, width: 400, position: :center
    pdf.move_down 20
  end

  def self.add_books(pdf, books)
    books.each do |book|
      pdf.font_size 16
      pdf.text "Book: #{book.title}", style: :bold
      pdf.move_down 10

      add_authors(pdf, book.authors)
      add_genres(pdf, book.genres)

      pdf.text "Year Published: #{book.year}"
      pdf.move_down 20
    end
  end

  def self.add_authors(pdf, authors)
    authors.each do |author|
      pdf.text "Author: #{author.name} #{author.second_name}"
    end
  end

  def self.add_genres(pdf, genres)
    genres.each do |genre|
      pdf.text "Genre: #{genre.name}"
    end
  end

  def self.save_pdf_file(library_id, pdf_content)
    dir = Rails.root.join('db/pdf_files')
    FileUtils.mkdir_p(dir) unless File.directory?(dir)
    filename = "library_#{library_id}.pdf"
    filepath = File.join(dir, filename)
    File.binwrite(filepath, pdf_content)

    filepath
  end
end
