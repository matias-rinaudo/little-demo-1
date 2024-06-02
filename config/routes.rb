Rails.application.routes.draw do
  root "home#index"
  resources :products
  resources :orders, only: [:index, :show, :new, :create]
  resources :carts, only: [:show, :destroy]
  resources :line_items, only: [:show, :destroy, :create] do
    member do
      post :add_quantity, as: "line_item_add"
      post :reduce_quantity, as: "line_item_reduce"
    end
  end
  devise_for :users
end
