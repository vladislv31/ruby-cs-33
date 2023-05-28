# frozen_string_literal: true

# test/models/reader_card_test.rb
require 'test_helper'

class ReaderCardTest < ActiveSupport::TestCase
  def setup
    @library = libraries(:one)
  end

  test 'should not save reader card without number' do
    reader_card = ReaderCard.new(library: @library)
    assert_not reader_card.save, 'Saved the reader card without a number'
  end

  test 'should not save reader card without a library' do
    reader_card = ReaderCard.new(number: '123456')
    assert_not reader_card.save, 'Saved the reader card without a library'
  end
end
