Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"
  resources :users, only: [:edit, :update]
    resources :rooms, only: [:new, :create, :destroy, :show] do
    resources :messages, only: [:index, :new, :create]
  end
end
