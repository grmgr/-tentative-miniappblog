Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'

  get 'posts' => 'users#show'
  resources :posts
  # , except: [:destroy]
  # delete 'posts/:id/destroy' => 'posts#destroy'
  resources :users, only: [:show]
end