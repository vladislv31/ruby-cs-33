# frozen_string_literal: true

# Model class for reader cards
class ReaderCard < ApplicationRecord
  belongs_to :library
  validates :number, presence: true, uniqueness: { index: true }
end
