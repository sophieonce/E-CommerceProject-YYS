Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # PRODUCTS
  get 'products'     => 'products#index'
  get 'products/:id' => 'products#show', as: 'product', id: /\d+/

  # CATEGORIES
  get 'categories/:id' => 'categories#show', as: 'category', id: /\d+/


  root to: 'products#index'


end
