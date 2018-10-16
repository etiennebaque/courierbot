Rails.application.routes.draw do

  devise_for :admins
  post 'sms/receive'
  resources :users

  root 'home#index'
  get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
