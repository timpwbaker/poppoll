Rails.application.routes.draw do
  root to: "pages#index"

  resources :pages, only: [:index]
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  resources :polls, only: [:new, :create, :show]
  resources :votes, only: [:create, :destroy]
end
