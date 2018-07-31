Rails.application.routes.draw do
  get 'users/new' => 'users#new'
  post 'users/create' => 'users#create'
  get 'users' => 'users#all'
  get 'users/:id' => 'users#show'

  root 'static_pages#index'
end
