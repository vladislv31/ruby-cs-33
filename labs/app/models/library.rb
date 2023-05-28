# frozen_string_literal: true

# Model class for libraries
class Library < ApplicationRecord
  has_many :books, dependent: :destroy

  validates :name, presence: true
  validates :address, presence: true
end
