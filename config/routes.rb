Rails.application.routes.draw do
  resources :users, except: [:new, :create] do
    resources :shows
  end

  resources :muppets do
    resources :shows
  end

  resources :shows

  root "welcome#home"

  get "/signup", to: "users#new", as: "signup"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new", as: "login"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
  get "/auth/github/callback", to: "sessions#create_with_github"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
