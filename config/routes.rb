Rails.application.routes.draw do
  
  root 'sessions#welcome'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  
  resources :posts
  resources :forums
  resources :characters
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
