# frozen_string_literal: true

# This class represents an library query that can be used to search for libraries.
class LibraryQuery
  def initialize(params)
    @params = params
  end

  def results
    libraries = Library.all

    libraries = libraries.where('name LIKE ?', "%#{@params[:name]}%") if @params[:name].present?

    libraries = libraries.where('address LIKE ?', "%#{@params[:address]}%") if @params[:address].present?

    libraries.order(@params[:sort])
  end
end
