Rails.application.routes.draw do
  root to: "toppages#index"
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get "signup", to: "users#new"
  resources :users do
    member do
      get :followings
      get :followers
      get :likes
    end
  end
  
  resources :microposts, only: [:new, :create, :destroy, :edit, :update]
  resources :relationships, only: [:create, :destroy]
  resources :favorites, onyl: [:create, :destroy]
end
