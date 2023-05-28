# frozen_string_literal: true

# Controls the behavior for managing pdf downloads of special library.
class PdfLibIdController < ApplicationController
  def export_lib_id
    library = Library.find(params[:id])
    pdf_data = PdfLibIdGenerator.generate_pdf(library.id, 'db/photos/library_id.jpeg')
    send_data pdf_data, filename: "library_#{library.id}.pdf", type: 'application/pdf'
  end
end
