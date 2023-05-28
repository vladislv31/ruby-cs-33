# frozen_string_literal: true

# Model class for books
class Book < ApplicationRecord
  belongs_to :library
  has_many :genres, dependent: :destroy
  has_many :authors, dependent: :destroy

  validates :title, presence: true
  validates :year, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
