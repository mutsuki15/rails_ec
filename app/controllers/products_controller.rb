# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :set_cart

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @related_products = Product.all.where.not(id: @product).order(updated_at: :asc).first(4)
  end

  private

  def set_cart
    @cart_item = CartItem.new
    @cart_items = current_cart.cart_items.includes([:product])
  end
end
