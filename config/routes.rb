Rails.application.routes.draw do
 
 root 'static#home'

 resources :applications, :users, :rides


end