# frozen_string_literal: true

# spec/factories.rb
FactoryBot.define do
  factory :author do
    name { 'John' }
    second_name { 'Doe' }
    age { 30 }
  end

  factory :book do
    title { 'My Book' }
    year { 2021 }
    library
  end
end
