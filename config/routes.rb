Rails.application.routes.draw do

  root to: "pages#index"
  get "about", to: "pages#about"

  get "login", to: "pages#new_login"
  post "login", to: "pages#process_login"

  get "logout", to: "pages#logout"

  resources :seats
  resources :flights
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
