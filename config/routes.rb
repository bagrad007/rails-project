Rails.application.routes.draw do
  resources :users, except: [:new, :create] do
    resources :shows
    resources :muppets
  end

  resources :muppets do
    resources :shows
  end

  resources :shows

  root "welcome#home"

  get "/shows_by_date", to: "shows#shows_by_date"

  get "/signup", to: "users#new", as: "signup"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new", as: "login"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
  match "/auth/github/callback", to: "sessions#create_with_github", via: [:get, :post]

  # match "/auth/github/callback" => "sessions#create_with_github", :as => :auth_callback

  # session.with_options :path_prefix => "auth" do |oauth|
  #   oauth.auth_failure "failure", :action => "auth_failure"
  #   oauth.auth ":provider", :action => "auth_new"
  #   oauth.auth_callback ":provider/callback", :action => "auth_create"
  # end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
