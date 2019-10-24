Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root 'products#index'
  
  resources :products, :order_items
  resource :cart, only: [:show]
  resource :users

  get '/signup', to: "users#new"
  post '/signup', to: "users#create"

  get '/login_page', to: "auth#signin"
  post '/login_page', to: "auth#verify"

  get '/logout', to: "auth#logout" 

  get '/cart/:id', to: "order_items#destroy", as: "delete_item"
  
end
