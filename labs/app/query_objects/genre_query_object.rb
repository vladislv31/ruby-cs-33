# frozen_string_literal: true

# app/query_objects/genre_query_object.rb
class GenreQueryObject < QueryObject
  def search(name: nil)
    @relation = @relation.where('name LIKE ?', "%#{name}%") if name.present?
    self
  end

  def sort(field: :name, direction: :asc)
    @relation = @relation.order("#{field} #{direction}")
    self
  end
end
