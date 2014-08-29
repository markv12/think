Rails.application.routes.draw do
  root 'front_page#index'
  resources :users
  resources :user_sessions
  resources :entry
end
