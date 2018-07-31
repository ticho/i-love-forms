Rails.application.routes.draw do

  # Routes of the app, didn't feel the need to create aliases for this project

  get 'users/error', to: 'users#create_error'
  get 'users/new', to: 'users#new'
  get 'users/new_for', to: 'users#new_for'
  get 'users/new_html', to: 'users#new_html'
  post 'users', to: 'users#create_for'
  post 'users/create', to: 'users#create'
  get 'users', to: 'users#all'
  get 'users/:id', to: 'users#show'

  root 'static_pages#index'
end
