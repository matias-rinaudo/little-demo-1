Rails.application.routes.draw do
  root 'home#index'
  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'signup' }
  devise_for :customers, path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'signup' }
  resources :products, only: [:index, :show]
  resources :orders, only: [:edit, :update]
  resources :carts, only: [:show, :destroy]
  resources :line_items, only: [:show, :destroy, :create] do
    member do
      post :add_quantity, as: "line_item_add"
      post :reduce_quantity, as: "line_item_reduce"
    end
  end
  namespace :admin do
    get '/', to: 'home#index'
    resources :products
    resources :orders, only: [:index, :show]
  end
end
