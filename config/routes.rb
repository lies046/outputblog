Rails.application.routes.draw do
  devise_for :users
  root to: 'top#index'
  resources :posts do
    resources :likes, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]
end
