Rails.application.routes.draw do
  
  root 'sessions#welcome'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  delete '/ban' => 'reports#approve'
  
  resources :posts, only: [:edit, :create, :update, :destroy]
  resources :forums, only: [:index, :show]
  resources :characters, only: [:show, :index]
  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :favorites, only: [:create, :destroy]
  resources :reports, only: [:new, :create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
