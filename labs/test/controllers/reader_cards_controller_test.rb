# frozen_string_literal: true

require 'test_helper'

class ReaderCardsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get reader_cards_index_url
    assert_response :success
  end

  test 'should get new' do
    get reader_cards_new_url
    assert_response :success
  end

  test 'should get show' do
    get reader_cards_show_url
    assert_response :success
  end

  test 'should get edit' do
    get reader_cards_edit_url
    assert_response :success
  end
end
