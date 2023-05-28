# frozen_string_literal: true

require_relative '../../app/models/application_record'
require_relative '../../app/models/author'
require_relative '../../app/models/book'
require_relative '../../app/models/library'

RSpec.describe Author do
  describe '#valid?' do
    let(:author) { Author.new(name: 'Test Author') }

    it 'returns true if the author has a name' do
      expect(author.valid?).to be(true)
    end

    it 'returns false if the author does not have a name' do
      author.name = nil
      expect(author.valid?).to be(false)
    end
  end

  # extract code into separate describe block
  describe '#name' do
    it 'returns the name of the author' do
      author = Author.new(name: 'Test Author')
      expect(author.name).to eq('Test Author')
    end
  end
end
