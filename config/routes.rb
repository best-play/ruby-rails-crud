Rails.application.routes.draw do
  resources :users

  root 'users#index'

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  namespace :api do
    resources :users, only: [:index, :show, :update, :create, :destroy]
    resources :images, only: [:index, :create, :destroy]
    resource :session, only: [:create, :destroy]
    resources :tasks, only: [:index, :create, :show]
  end
end
