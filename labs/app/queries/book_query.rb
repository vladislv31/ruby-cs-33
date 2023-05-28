# frozen_string_literal: true

# This class represents an book query that can be used to search for books.
class BookQuery
  def initialize(params)
    @params = params
  end

  def results
    books = Book.all
    books = filter_by_title(books)
    books = filter_by_year(books)
    books = filter_by_library_id(books)
    books = filter_by_author_id(books)
    books = filter_by_genre_id(books)
    books.order(@params[:sort])
  end

  private

  def filter_by_title(books)
    return books if @params[:title].blank?

    books.where('title LIKE ?', "%#{@params[:title]}%")
  end

  def filter_by_year(books)
    return books if @params[:year].blank?

    books.where(year: @params[:year])
  end

  def filter_by_library_id(books)
    return books if @params[:params]&.dig(:library_id).blank?

    books.where(library_id: @params[:params][:library_id])
  end

  def filter_by_author_id(books)
    return books if @params[:params]&.dig(:author_id).blank?

    books.joins(:authors).where(authors: { id: @params[:params][:author_id] })
  end

  def filter_by_genre_id(books)
    return books if @params[:params]&.dig(:genre_id).blank?

    books.joins(:genres).where(genres: { id: @params[:params][:genre_id] })
  end
end
