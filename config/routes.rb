Rails.application.routes.draw do
  root to: 'property#index'
  
  get '/properties', to: 'property#index', as: 'properties'
  get '/property/:id', to: 'property#show', as: 'property'

  get '/users', to: 'user#index', as: 'users'
  get '/user/:id', to: 'user#show', as: 'user'
end
