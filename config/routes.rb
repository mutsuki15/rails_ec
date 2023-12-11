# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    root to: 'products#index'
    resources :orders
    resources :products
  end

  root to: 'products#index'
  resources :products
  resources :cart_items do
    post 'apply_promotion_code', on: :collection
    delete 'delete_promotion_code', on: :collection
  end
  resources :orders
end
