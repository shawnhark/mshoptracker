Rails.application.routes.draw do
  root 'welcome#welcome'
  get 'home', to: 'welcome#welcome'

  resources :users, only: [:create, :new, :show]
  resources :sessions, only: [:create, :new, :destroy]
  resources :shops, only: [:index, :show]

  get 'register', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  get 'shops', to: 'shops#index'
end
