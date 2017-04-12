Rails.application.routes.draw do
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


  #login and logout
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'


  get 'addresses/:id' => 'addresses#show', as: 'address', id: /\d+/

  #CREATE address
  get 'addresses/new'  =>'addresses#new', as: 'new_address'
  post 'addresses'     =>'addresses#create'

  # UPDATE Routes
  get 'addresses/:id/edit'  =>'addresses#edit', as: 'edit_address', id: /\d+/
  patch 'addresses/:id'     => 'addresses#update'



  root to: 'products#index'


end
