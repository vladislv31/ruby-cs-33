# frozen_string_literal: true

# test/models/genre_test.rb
require 'test_helper'

class GenreTest < ActiveSupport::TestCase
  def setup
    @book = books(:one)
  end

  test 'should not save genre without name' do
    genre = Genre.new(book: @book)
    assert_not genre.save, 'Saved the genre without a name'
  end

  test 'should not save genre without a book' do
    genre = Genre.new(name: 'Test')
    assert_not genre.save, 'Saved the genre without a book'
  end
end
