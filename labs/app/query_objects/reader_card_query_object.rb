# frozen_string_literal: true

# app/query_objects/reader_card_query_object.rb
class ReaderCardQueryObject < QueryObject
  def search(number: nil)
    @relation = @relation.where('number LIKE ?', "%#{number}%") if number.present?
    self
  end

  def sort(field: :number, direction: :asc)
    @relation = @relation.order("#{field} #{direction}")
    self
  end
end
