Hacker::Application.routes.draw do
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users
  resources :sessions
  resources :posts
  resources :votes, only: :create
  resources :comments, only: :create

  root to: 'posts#index'
end
