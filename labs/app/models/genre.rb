# frozen_string_literal: true

# Model class for genres
class Genre < ApplicationRecord
  belongs_to :book

  validates :name, presence: true
end
