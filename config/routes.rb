Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations',
    unlocks: 'users/unlocks'
  }
  resources :users
  resources :articles

  get '/sessions/index', to: 'sessions#index', as: 'session_index'
  get '/home/index', to: 'home#index', as: 'home_index'


  get '/rails/routes', to: 'routes#index'

  root "home#index"
end
