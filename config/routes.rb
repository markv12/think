Rails.application.routes.draw do
  root 'front_page#index'

  get '/me', to: 'users#show'
  get '/users/new', to: 'users#new', as: 'new_user'
  post '/users', to: 'users#create'
  get '/entries/:id', to: 'entries#show', as: 'entry'
  patch '/entries/:id', to: 'entries#update', as: 'entry_update'

  get '/assessments', to: 'assessments#index'
  get '/assessment/:id', to: 'assessments#show', as: 'assessment'
  get '/take_assessment/:id', to: 'assessments#take', as: 'take_assessment'
  post '/submit_assessment', to: 'assessments#submit', as: 'submit_assessment'

  resources :user_sessions
end
