# frozen_string_literal: true

require_relative '../../app/queries/author_query'
require_relative '../../app/queries/book_query'
require_relative '../../app/queries/library_query'
require 'rails_helper'

RSpec.describe AuthorQuery do
  let!(:author1) { create(:author, name: 'John', second_name: 'Doe', age: 30) }
  let!(:author2) { create(:author, name: 'Jane', second_name: 'Doe', age: 40) }
  let!(:book) { create(:book) }
  let!(:author3) { create(:author, name: 'Tom', second_name: 'Smith', age: 25, book_id: book.id) }

  describe '#results' do
    context 'with name param' do
      it 'returns authors with matching name' do
        query = AuthorQuery.new(name: 'John')
        expect(query.results).to eq([author1])
      end
    end

    context 'with second_name param' do
      it 'returns authors with matching second_name' do
        query = AuthorQuery.new(second_name: 'Doe')
        expect(query.results).to eq([author1, author2])
      end
    end

    context 'with age param' do
      it 'returns authors with matching age' do
        query = AuthorQuery.new(age: 25)
        expect(query.results).to eq([author3])
      end
    end
  end
end
