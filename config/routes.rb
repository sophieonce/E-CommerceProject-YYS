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


  # SHOW customers: welcome message
  get 'customers/:id' => 'customers#show', as: 'customer', id: /\d+/

  #CREATE customer
  get 'customers/new'  =>'customers#new', as: 'new_customer'
  post 'customers'     =>'customers#create'



  root to: 'products#index'


end
