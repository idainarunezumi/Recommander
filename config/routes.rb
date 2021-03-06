Rails.application.routes.draw do
  resources :blogs
  root 'home#top'

  post  "likes/:post_id/create" => "likes#create"
  post  "likes/:post_id/destroy" => "likes#destroy"

  post "logout" => "users#logout"
  get "login" => "users#login_form"
  post "login" => "users#login"
  get "users/:id/update" => "users#update"
  post "users/:id/update" => "users#update"
  get "users/:id/edit" =>"users#edit"
  get "users/create" =>"users#create"
  post "users/create" =>"users#create"
  get "signup" =>"users#new"
  get "users/index" =>"users#index"
  get "users/:id" =>"users#show"

  get "posts/index" =>"posts#index"
  get "posts/new" =>"posts#new"
  get "posts/:id" =>"posts#show"
  get "posts/create" =>"posts#create"
  post "posts/create" =>"posts#create"
  get "posts/:id/edit" => "posts#edit"
  get "posts/:id/update" => "posts#update"
  post "posts/:id/update" => "posts#update"
  get "posts/:id/update" => "posts#update"
  get "posts/:id/destroy" => "posts#destroy"
  post "posts/:id/destroy" => "posts#destroy"

  get '/' => "home#top"
  get "/about" =>"home#about"

end
