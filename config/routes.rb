Rails.application.routes.draw do
  resources :users

  root 'users#index'

  namespace :api do
    resources :users, only: [:index, :show, :update, :create, :destroy]
    resources :images, only: [:index, :create, :destroy]
    resource :session, only: [:create, :destroy]
  end
end
