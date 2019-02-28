Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#welcome'

  resources :sessions, only: [:create, :destroy]
  resources :ogps, only: [:create, :show]

  get 'login', to: 'sessions#new', as: 'login'
  get 'welcome', to: 'home#welcome'
end
