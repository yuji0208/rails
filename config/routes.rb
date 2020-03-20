Rails.application.routes.draw do
  get 'topics/new'
  get 'sessions/new'
  get 'users/new'
  get 'pages/help'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'

  get    '/login',   to: 'sessions#new' #get=取得
  post   '/login',   to: 'sessions#create' #post=作成
  delete '/logout',  to: 'sessions#destroy'
  
  resources :users
  resources :topics
  
  get 'favorites/index'
  post '/favorites', to: 'favorites#create'
  delete '/favorites', to: 'favorites#destroy'
end
