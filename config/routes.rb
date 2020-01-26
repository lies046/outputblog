Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations',
                                    sessions: 'users/sessions' } 
  root to: 'top#index'
  resources :posts do
    resources :likes, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]
end
