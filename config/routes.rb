Rails.application.routes.draw do
  root 'front_page#index'

  get '/me', to: 'users#show'
  get '/users/new', to: 'users#new'
  post '/users', to: 'users#create'
  get '/entries/:id', to: 'entries#show', as: 'entry'
  patch '/entries/:id', to: 'entries#update', as: 'entry_update'

  resources :user_sessions
end
