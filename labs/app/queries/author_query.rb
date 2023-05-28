# frozen_string_literal: true

# This class represents an author query that can be used to search for authors.
class AuthorQuery
  def initialize(params)
    @params = params
  end

  def results
    authors = filter_authors_by_name(Author.all)
    authors = filter_authors_by_second_name(authors)
    authors = filter_authors_by_age(authors)
    authors = filter_authors_by_book_id(authors)

    authors.order(@params[:sort])
  end

  private

  def filter_authors_by_name(authors)
    return authors if @params[:name].blank?

    authors.where('name LIKE ?', "%#{@params[:name]}%")
  end

  def filter_authors_by_second_name(authors)
    return authors if @params[:second_name].blank?

    authors.where('second_name LIKE ?', "%#{@params[:second_name]}%")
  end

  def filter_authors_by_age(authors)
    return authors if @params[:age].blank?

    authors.where(age: @params[:age])
  end

  def filter_authors_by_book_id(authors)
    return authors if @params.dig(:params, :book_id).blank?

    authors.where(book_id: @params[:params][:book_id])
  end
end
