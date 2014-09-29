Rails.application.routes.draw do
  root 'welcome#welcome'
  get 'home', to: 'welcome#welcome'

  resources :users, only: [:create, :new]
  resources :sessions, only: [:create, :new]
  resources :shops

  get 'register', to: 'users#new'
  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'

end
