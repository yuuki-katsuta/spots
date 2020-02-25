Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'toppages#index'
  
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'spots/new', to: 'spots#new'
  post 'spots', to: 'spots#create'
  get 'spots/index', to: 'spots#index'
  
  resources :users, only: [:index, :show, :new, :create]
  resources :spots, only: [:create, :destroy,]
end
