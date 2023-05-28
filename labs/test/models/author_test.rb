# frozen_string_literal: true

# test/models/author_test.rb
require 'test_helper'

class AuthorTest < ActiveSupport::TestCase
  def setup
    @library = libraries(:one)
    @book = books(:one)
  end

  test 'should not save author without name' do
    author = Author.new(second_name: 'Test', age: 30, book: @book)
    assert_not author.save, 'Saved the author without a name'
  end

  test 'should not save author without second name' do
    author = Author.new(name: 'Test', age: 30, book: @book)
    assert_not author.save, 'Saved the author without a second name'
  end

  test 'should not save author without age' do
    author = Author.new(name: 'Test', second_name: 'Test', book: @book)
    assert_not author.save, 'Saved the author without an age'
  end

  test 'should not save author without a book' do
    author = Author.new(name: 'Test', second_name: 'Test', age: 30)
    assert_not author.save, 'Saved the author without a book'
  end
end
