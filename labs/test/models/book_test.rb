# frozen_string_literal: true

require 'test_helper'

class BookTest < ActiveSupport::TestCase
  def setup
    @library = libraries(:one)
  end

  test 'should not save book without title' do
    book = Book.new(year: 2021, library: @library)
    assert_not book.save, 'Saved the book without a title'
  end

  test 'should not save book without year' do
    book = Book.new(title: 'Test Book', library: @library)
    assert_not book.save, 'Saved the book without a year'
  end

  test 'should not save book without a library' do
    book = Book.new(title: 'Test Book', year: 2021)
    assert_not book.save, 'Saved the book without a library'
  end
end
