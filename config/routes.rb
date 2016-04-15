Rails.application.routes.draw do
  get '/', to: 'static#home'
  root 'static#home'
  get '/signin', to: 'sessions#new', as: "signin"
  post 'sessions/create'
  get 'sessions/destroy', as: 'signout'
  resources :attractions, :users, :rides


end