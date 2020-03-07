Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'toppages#index'
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'spots/new', to: 'spots#new'
  post 'spots', to: 'spots#create'
  delete 'spots/:id', to: 'spots#destroy'
  resources :spots, only: [:destroy, :show, :edit, :update]
  resources :users, only: [:index, :show, :new, :create, :likes, :edit, :update] do
    member do
      get :likes
    end
  end  
  resources :favorites, only: [:create, :destroy]
end
