Rails.application.routes.draw do
  root to: 'welcome#welcome'
  get 'home', to: 'welcome#welcome'

  resources :users, only:[:show, :create, :edit, :update]
    resources :shops
    resources :payments
  resources :sessions, only: [:new, :create, :destroy]
  

  get 'register', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'about', :to => redirect('/about.html')
end
