Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope "(:locale)", locale: /en|ru|fr/ do
    resources :welcome, only: [:index]
    resources :about, only: [:index]

    resources :users, only: [:new, :create]
    resources :sessions

    resources :posts

    get "logout" => "sessions#destroy", :as => "logout"
    get "signin" => "sessions#new", :as => "sign_in"
    get "signup" => "users#new", :as => "sign_up"

    root 'welcome#index'
  end
end
