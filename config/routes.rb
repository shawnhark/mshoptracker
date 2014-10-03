Rails.application.routes.draw do
  root to: 'welcome#welcome'
  get 'home', to: 'welcome#welcome'

  resources :users, only:[:show, :create, :edit, :update]
  resources :sessions, only: [:new, :create, :destroy]
  resources :shops, only: [:index, :show]

  get 'register', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'shops', to: 'shops#index'
  get 'about', to: 'general#about'
end
