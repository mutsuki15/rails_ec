# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resources :products
  end

  root to: 'products#index'
  resources :products
  resources :cart_items

end
