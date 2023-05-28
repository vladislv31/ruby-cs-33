# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get '/login', to: 'devise/sessions#login'
    get '/signup', to: 'devise/registrations#sign_up'
    get '/logout', to: 'devise/sessions#destroy'
  end

  resources :libraries
  resources :books
  delete 'books/:id', to: 'books#destroy', as: :destroy_book
  resources :authors
  resources :genres
  resources :reader_cards
  get 'search_lib', to: 'search#search_lib'
  get 'search_book', to: 'search#search_book'
  get 'search_author', to: 'search#search_author'
  get 'search_genre', to: 'search#search_genre'
  get 'search_card', to: 'search#search_card'
  get 'export_libraries_csv', to: 'libraries_csv#export', as: 'export_libraries_csv'
  get 'export_pdf_library', to: 'pdf_downloader#export_library', as: 'export_pdf_library'
  get 'export_pdf_author', to: 'pdf_downloader#export_author', as: 'export_pdf_author'
  get 'export_pdf_genre', to: 'pdf_downloader#export_genre', as: 'export_pdf_genre'
  get 'export_pdf_book', to: 'pdf_downloader#export_book', as: 'export_pdf_book'
  get 'export_pdf_card', to: 'pdf_downloader#export_reader_card', as: 'export_pdf_card'
  get 'export_pdf_lib_id', to: 'pdf_lib_id#export_lib_id'
end
