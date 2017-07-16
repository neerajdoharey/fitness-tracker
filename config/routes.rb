Rails.application.routes.draw do

  get 'reports/weight'

  get 'reports/bodyfat'

  devise_for :users, :controllers => { :registrations => 'user/registrations' }
  root 'dashboard#index'

  resources :user_profile ,only: [:edit, :show]
  resources :preference ,only: [:edit, :show]
  resources :body_stats
  resources :diet_plans

  get 'bmi_calculator',to: "calculator#bmi_calculator"
  get 'test',to: "calculator#test"

  post 'add_weight',to: 'body_stats#add_weight'
  post 'add_bodyfat',to: 'body_stats#add_bodyfat'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
