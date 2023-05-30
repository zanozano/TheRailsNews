Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  get '/sessions/index', to: 'sessions#index', as: 'session_index'
  get '/home/index', to: 'home#index', as: 'home_index'
  
  resources :articles
  
  root "home#index"
end
