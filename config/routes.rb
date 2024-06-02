Rails.application.routes.draw do
  root "home#index"
  devise_for :users
  resources :products, only: [:index, :show]
  resources :orders, only: [:index, :show, :edit, :update]
  resources :carts, only: [:show, :destroy]
  resources :line_items, only: [:show, :destroy, :create] do
    member do
      post :add_quantity, as: "line_item_add"
      post :reduce_quantity, as: "line_item_reduce"
    end
  end

  namespace :admin do
    resources :products
    resources :orders, only: [:index, :show]
  end
end
