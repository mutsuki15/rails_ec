# frozen_string_literal: true

class ApplicationController < ActionController::Base

  def current_cart
      current_cart = Customer.find_by(id: session[:customer_id])
      current_cart = Customer.create unless current_cart
      session[:customer_id] = current_cart.id
      current_cart
  end

end
