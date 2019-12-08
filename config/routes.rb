Rails.application.routes.draw do
  

  get '/' => 'sessions#welcome'
  get 'meals/grouped_ratings', to: 'meals#ratings'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  delete '/logout' => 'sessions#destroy'

  resources :meals do
    resources :reviews, only: [:new, :index]
  end
  resources :restaurants
  resources :users
  resources :reviews
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html



end
