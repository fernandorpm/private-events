Rails.application.routes.draw do
  resources :events
  # post '/events', to: 'events#create'
  resources :users #only: [:index, :create]
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  
  get '/logout', to: 'sessions#destroy'
  root to: "static#home"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
