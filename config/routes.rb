Rails.application.routes.draw do
  resources :users
  resources :reviews
  resources :movies, only: [:index, :show]
  resources :comments, only: [:new, :create]
  root 'application#welcome'
  get '/login' => 'sessions#new'
  get '/add' => 'reviews#add'
  post '/sessions' => 'sessions#create'
  delete '/sessions' => 'sessions#destroy'
  get '/signup' => 'users#new'
  get '/search' => 'movies#search'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
