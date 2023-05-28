# frozen_string_literal: true

# app/query_objects/book_query_object.rb
class BookQueryObject < QueryObject
  def search(title: nil, year: nil)
    @relation = @relation.where('title LIKE ?', "%#{title}%") if title.present?
    @relation = @relation.where(year: year) if year.present?
    self
  end

  def sort(field: :title, direction: :asc)
    @relation = @relation.order("#{field} #{direction}")
    self
  end
end
