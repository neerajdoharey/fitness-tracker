Rails.application.routes.draw do

  devise_for :users, :controllers => { :registrations => 'user/registrations' }
  root 'dashboard#index'

  resources :user_profile
  resources :preference
  resources :body_stats
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
