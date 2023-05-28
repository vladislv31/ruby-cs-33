# frozen_string_literal: true

# app/query_object.rb
class QueryObject
  def initialize(relation)
    @relation = relation
  end

  def call
    @relation
  end
end
