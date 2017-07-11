Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => 'user/registrations' }
  root 'dashboard#index'

  resources :user_profile ,only: [:edit, :show]
  resources :preference ,only: [:edit, :show]
  resources :body_stats

  get 'bmi_calculator',to: "calculator#bmi_calculator"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
