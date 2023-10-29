Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources 'posts'
  resources 'users'
  resources 'articles'
  resources 'groups'
  # Defines the root path route ("/")
  # root "articles#index"
  root "home#top"
  resources 'categories'
  
  get "/login_page" => "home#login_page"
  post "/login" => "home#login"
  post "/logout" => "home#logout"

  post '/google_login_api/callback', to: 'home#callback'
end
