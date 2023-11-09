# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products = Product.all
    @cart_item = CartItem.new
    @cart_items = current_cart.cart_items.includes([:product])
  end

  def show
    @product = Product.find(params[:id])
    @related_products = Product.all.where.not(id: @product).order(updated_at: :asc).first(4)
    @cart_item = CartItem.new
    @cart_items = current_cart.cart_items.includes([:product])
  end
end
