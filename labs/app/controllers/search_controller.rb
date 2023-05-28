# frozen_string_literal: true

# Controls the behavior for managing search.
class SearchController < ApplicationController
  def search_lib
    @libraries = LibraryQuery.new(params).results.page(params[:page]).per(10)
  end

  def search_book
    @books = BookQuery.new(params).results
  end

  def search_author
    @authors = AuthorQuery.new(params).results
  end

  def search_genre
    @genres = GenreQuery.new(params).results
  end

  def search_card
    @cards = CardQuery.new(params).results
  end
end
