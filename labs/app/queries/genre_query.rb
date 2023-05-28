# frozen_string_literal: true

# This class represents an genres query that can be used to search for genres.
class GenreQuery
  def initialize(params)
    @params = params
  end

  def results
    genres = Genre.all

    genres = genres.where('name LIKE ?', "%#{@params[:name]}%") if @params[:name].present?

    if @params[:params] && @params[:params][:book_id].present?
      genres = genres.where(book_id: @params[:params][:book_id])
    end

    genres.order(@params[:sort])
  end
end
