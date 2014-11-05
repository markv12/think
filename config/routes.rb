Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  root 'front_page#index'

  get '/me', to: 'users#show'
  get '/user_graph', to:'users#graph', as: 'user_graph'
  get '/users/new', to: 'users#new', as: 'new_user'
  post '/users', to: 'users#create'
  get '/entries/:id', to: 'entries#show', as: 'entry'
  patch '/entries/:id', to: 'entries#update', as: 'entry_update'

  get '/assessments', to: 'assessments#index'
  get '/assessment/:id', to: 'assessments#show', as: 'assessment'
  get '/take_assessment/:id', to: 'assessments#take', as: 'take_assessment'
  post '/submit_response', to: 'assessments#submit', as: 'submit_response'
  patch '/update_response/:id', to: 'assessments#update', as: 'update_response'

  post '/new_question/:id', to: 'assessments#add_question', as: 'add_question'

  resources :user_sessions
  get '/logout', to: 'user_sessions#destroy', as: 'destroy_user_session'
end
