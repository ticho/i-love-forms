Rails.application.routes.draw do
  get 'users/error', to: 'users#create_error'
  get 'users/new' => 'users#new'
  get 'users/new_for' => 'users#new_for'
  get 'users/new_html' => 'users#new_html'
  post 'users' => 'users#create_for'
  post 'users/create' => 'users#create'
  get 'users' => 'users#all'
  get 'users/:id' => 'users#show'

  root 'static_pages#index'
end
