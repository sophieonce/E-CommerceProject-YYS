Rails.application.routes.draw do
  get 'carts/index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # PRODUCTS
  get 'products'     => 'products#index'
  get 'products/:id' => 'products#show', as: 'product', id: /\d+/

  # CATEGORIES
  get 'categories/:id' => 'categories#show', as: 'category', id: /\d+/

  # CARTS: add item, showing and clear cart
  get 'carts' => 'carts#index'
  get 'carts/clear' => 'carts#clearCart', as: 'cart_clear'
  get 'carts/:id' => 'carts#add', as: 'cart', id: /\d+/

  # UPDATE CARTS QUANTITY
  patch 'carts/:id'     => 'carts#update'

  # DELETE CART ITEM
  delete 'carts/:id'  =>'carts#destroy',as: 'destroy_item', id: /\d+/


  root to: 'products#index'


end
