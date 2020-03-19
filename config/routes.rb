Rails.application.routes.draw do
  get 'topics/new'
  get 'sessions/new'
  get 'users/new'
  get 'pages/help'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create' #post=作成
  delete '/logout',  to: 'sessions#destroy'
  
  resources :users
  resources :topics
end
