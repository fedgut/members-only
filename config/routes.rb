# frozen_string_literal: true

Rails.application.routes.draw do

  get '/', to: 'static_pages#index'

  get 'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'
  delete 'singout', to: 'sessions#delete'
end
