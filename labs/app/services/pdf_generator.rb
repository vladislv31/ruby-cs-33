# frozen_string_literal: true

require 'prawn'
require 'prawn/table'

# This class represents a PDF generator that can be used to generate PDFs.
class PdfGenerator
  PHOTO_PATHS = {
    'authors' => 'db/photos/author.jpeg',
    'books' => 'db/photos/book.jpeg',
    'libraries' => 'db/photos/library.jpeg',
    'genres' => 'db/photos/genre.jpeg',
    'reader_cards' => 'db/photos/card.jpeg'
  }.freeze

  def self.generate(table_name, data)
    pdf = Prawn::Document.new
    pdf.fill_color '666666'

    add_title(pdf, table_name)
    add_photo(pdf, table_name)
    add_table(pdf, data)

    save_pdf(pdf, table_name)
  end

  def self.add_title(pdf, table_name)
    pdf.text "#{table_name.capitalize} Table", size: 18, style: :bold, align: :center
    pdf.move_down 20
  end

  def self.add_photo(pdf, table_name)
    photo_path = PHOTO_PATHS[table_name]

    return unless File.exist?(photo_path)

    pdf.image photo_path, width: 400, position: :center
    pdf.move_down 20
  end

  def self.add_table(pdf, data)
    pdf.table data do |table|
      table.header = true
      table.row_colors = %w[FFFFFF DDDDDD]
      table.columns(0..-1).align = :center
      table.row(0).font_style = :bold
    end
  end

  def self.save_pdf(pdf, table_name)
    dir = Rails.root.join('db/pdf_files')
    FileUtils.mkdir_p(dir) unless File.directory?(dir)
    filename = "#{table_name}.pdf"
    filepath = File.join(dir, filename)
    File.binwrite(filepath, pdf.render)

    filepath
  end
end
