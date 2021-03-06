require 'api_constraints'

Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :users, only: [:index, :show, :create, :update, :destroy]
      resources :devices, only: [:index, :destroy]
      resources :sessions, only: [:create, :destroy]
      resources :todos, only: [:index, :show, :create, :update, :destroy]
    end
  end

end
