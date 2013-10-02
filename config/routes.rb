Hacker::Application.routes.draw do
  resources :posts
  resources :votes, only: :create
  resources :comments

  root to: 'posts#index'
end
