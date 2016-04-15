Rails.application.routes.draw do
  get '/', to: 'static#home'
  root 'static#home'
  get '/signin', to: 'sessions#new', as: "signin"
  post 'sessions/create'
  delete 'sessions/destroy', to: "sessions#destroy", as: 'signout'
  resources :attractions, :users 
  post 'attractions/:id/', to: "attractions#ride", as: "ride"

end