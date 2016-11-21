Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :welcome, only: [:index]

  resources :users, only: [:new,:create]
  resources :sessions

  resources :posts

  get "logout" => "sessions#destroy", :as => "logout"
  get "signin" => "sessions#new", :as => "signin"
  get "signup" => "users#new", :as => "signup"

  root 'welcome#index'
end
