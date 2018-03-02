Rails.application.routes.draw do
  root to: 'users#index'
  get '/users/new', to: 'users#new', as: 'new_user'
  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show', as: 'user'
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'
  post '/sessions', to: 'sessions#create'
  get '/events', to: 'events#index'
  get '/events/new', to: 'events#new', as: 'new_event'
  get '/events/:id', to: 'events#show', as: 'event'
  post '/events', to: 'events#create'
  # get '/about', to: 'users#about'

end
