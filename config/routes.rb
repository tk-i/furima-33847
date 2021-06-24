Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items do
    resources :logs, only: [:index, :create]
  end
  resources :cards, only: [:new, :create, :destroy]
end
