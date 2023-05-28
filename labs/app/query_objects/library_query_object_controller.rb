# frozen_string_literal: true

# This class represents a controller for the library query object.
class LibraryQueryObjectController < QueryObject
  def search(name: nil, address: nil)
    @relation = @relation.where('name LIKE ?', "%#{name}%") if name.present?
    @relation = @relation.where('address LIKE ?', "%#{address}%") if address.present?
    self
  end

  def sort(field: :name, direction: :asc)
    @relation = @relation.order("#{field} #{direction}")
    self
  end
end
