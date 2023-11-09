# frozen_string_literal: true

class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger

  def current_cart
    current_cart = Customer.find_by(id: session[:customer_id])
    current_cart ||= Customer.create
    session[:customer_id] = current_cart.id
    current_cart
  end
end
