Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations',
                                    sessions: 'users/sessions',
                                    omniauth_callbacks: 'users/omniauth_callbacks'} 
  root to: 'top#index'
  resources :posts do
    resources :likes, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]
 
end