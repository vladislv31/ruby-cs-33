# frozen_string_literal: true

# app/query_objects/author_query_object.rb
class AuthorQueryObject < QueryObject
  def search(name: nil, second_name: nil, age: nil)
    @relation = @relation.where('name LIKE ?', "%#{name}%") if name.present?
    @relation = @relation.where('second_name LIKE ?', "%#{second_name}%") if second_name.present?
    @relation = @relation.where(age: age) if age.present?
    self
  end

  def sort(field: :name, direction: :asc)
    @relation = @relation.order("#{field} #{direction}")
    self
  end
end
