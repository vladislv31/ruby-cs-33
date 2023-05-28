# frozen_string_literal: true

# Model class for authors
class Author < ApplicationRecord
  belongs_to :book

  validates :name, presence: true
  validates :second_name, presence: true
  validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
