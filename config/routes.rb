Rails.application.routes.draw do
  devise_for :users
  get 'habits/index'
  root to: 'habits#index'
  resources :habits

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
