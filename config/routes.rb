Rails.application.routes.draw do
  root 'front_page#index'

  get '/me', to: 'users#show'
  get '/users/new', to: 'users#new', as: 'new_user'
  post '/users', to: 'users#create'
  get '/entries/:id', to: 'entries#show', as: 'entry'
  patch '/entries/:id', to: 'entries#update', as: 'entry_update'

  get '/assessments', to: 'assessments#index'
  resources :user_sessions
end
