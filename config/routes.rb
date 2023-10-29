Rails.application.routes.draw do
  resources 'users'
  resources 'articles'
  resources 'groups'
  root "home#top"
  resources 'categories'
  resources 'posts'
  get "/login_page" => "home#login_page"
  post "/login" => "home#login"
  post "/logout" => "home#logout"

  post '/google_login_api/callback', to: 'home#callback'
end
