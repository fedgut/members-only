# frozen_string_literal: true

Rails.application.routes.draw do

  get '/', to: 'static_pages#index', as: 'home'

  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'

  get 'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'
  delete 'signout', to: 'sessions#delete'
  resource :user
  resources :posts, only: [:new, :create, :index]
end
