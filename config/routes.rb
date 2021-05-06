Rails.application.routes.draw do
  resources :users

  get "/sessions/login", to: "sessions#login", as: "/login"
  post "/sessions/logged_in", to: "sessions#logged_in"
  delete "/sessions/logout", to: "sessions#logout"

  root to: "users#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
