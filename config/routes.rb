Rails.application.routes.draw do
  root 'front_page#index'
  resources :users do
    resources :entries
  end
  resources :user_sessions
end
