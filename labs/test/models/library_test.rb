# frozen_string_literal: true

# test/models/library_test.rb
require 'test_helper'

class LibraryTest < ActiveSupport::TestCase
  test 'should not save library without a name' do
    library = Library.new(address: '123 Main St')
    assert_not library.save, 'Saved the library without a name'
  end

  test 'should not save library without an address' do
    library = Library.new(name: 'Public Library')
    assert_not library.save, 'Saved the library without an address'
  end

  test 'should save library with a name and an address' do
    library = Library.new(name: 'Public Library', address: '123 Main St')
    assert library.save, 'Could not save the library'
  end
end
