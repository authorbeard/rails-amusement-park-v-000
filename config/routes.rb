Rails.application.routes.draw do
  get '/', to: 'static#home'
  root 'static#home'
  get '/signin', to: 'sessions#new', as: "signin"
  post 'sessions/create'
  delete 'sessions/destroy', to: "sessions#destroy", as: 'signout'
  resources :attractions, :users 
  post 'users/:id/', to: "users#ride", as: "ride"

end